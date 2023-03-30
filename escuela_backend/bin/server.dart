import 'dart:io';
import 'dart:convert';
import 'package:dotenv/dotenv.dart' show DotEnv;
import 'package:escuela_backend/repositories/base_repository.dart';
import 'package:escuela_backend/repositories/repositories.dart';
import 'package:escuela_backend/utility/supabase/client_supabase.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart';

import 'package:watcher/watcher.dart';
import 'package:logger/logger.dart';

import 'package:escuela_backend/router/router.dart';

final logger = Logger();
void main(List<String> args) async {
  final dotEnv = await DotEnv(includePlatformEnvironment: true)
    ..load();
  final envFile = args.isNotEmpty ? '.env.${args[0]}' : '.env.dev';
  dotEnv.load([envFile]);

  final escuelasRouter = EscuelasRouter();

  final date = DateTime.now();
  final enviroment = dotEnv['ENVIROMENT'];
  // Agregar ruta para el endpoint raíz

  escuelasRouter.router.get('/', (Request request) {
    return Response.ok('server running ok at $date, enviroment: $enviroment');
  });

  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline()
      .addMiddleware(corsHeaders())
      .addMiddleware(logRequests())
      .addMiddleware((innerHandler) => (request) async {
            final contentType = request.headers['content-type'];
            if (contentType?.startsWith('application/json') == true) {
              final body = await request.readAsString();
              final json = jsonDecode(body);
              request = request.change(context: {'body': json});
            }
            return innerHandler(request);
          })
      .addHandler(escuelasRouter.router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  Repository.globalClient = SupabaseClient(
    dotEnv['SUPABASE_URL']!,
    dotEnv['SUPABASE_KEY']!,
  );

  var server = await serve(handler, ip, port);
  if (enviroment == 'prod') {
    print(
        'be careful, you are in production mode \nbe extremely careful with the execution of the script, \nthe database can break catastrophically!');
  }
  print('Server listening on port ${server.port}');

  final directory = Directory('.');
  final watcher = Watcher(directory.path);

  // Watch for changes in the current directory.
  watcher.events.listen((event) async {
    if (event.type == ChangeType.MODIFY || event.type == ChangeType.ADD) {
      // If any file changes, restart the server.
      print('Changes detected. Restarting server...');
      await server.close(force: true);
      server = await serve(handler, ip, port);
      print('Server restarted on port ${server.port}');
    }
  });
}
