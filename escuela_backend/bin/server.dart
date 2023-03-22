import 'dart:io';

import 'dart:convert';

import 'package:dotenv/dotenv.dart';
import 'package:escuela_backend/router/router.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:watcher/watcher.dart';
import 'package:supabase/supabase.dart';

void main(List<String> args) async {
  final escuelasRouter = EscuelasRouter();

  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final handler = Pipeline()
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

  var server = await serve(handler, ip, port);
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
