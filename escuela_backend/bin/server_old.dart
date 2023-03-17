import 'dart:io';

import 'package:shelf/shelf.dart' as shelf;
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

const _hostname = 'localhost';
const _port = 8080;

void main(List<String> args) async {
  final handler = const shelf.Pipeline()
      .addMiddleware(shelf.logRequests())
      .addMiddleware((innerHandler) => (request) async {
            final updateRequest = request.change(
              headers: {'My-Custom-Header': 'powered by chivocoder'},
            );
            return await innerHandler(updateRequest);
          })
      .addHandler((request) => shelf.Response.ok(
          'hello word ${request.headers["My-Custom-Header"]}'));

  final server = await io.serve(handler, _hostname, _port);

  //final server = await io.serve(
  //(request) => shelf.Response.ok('todo ok'), _hostname, _port);

  // final server = await HttpServer.bind(_hostname, _port);
  // final ioserver = await io.IOServer(server);

  // ioserver.mount(
  //   (request) => shelf.Response.ok('hello word'),
  // );

  // final ioserver = await io.IOServer.bind(_hostname, _port);
  // ioserver.mount(
  //   (request) => shelf.Response.ok('hello word'),
  // );

  //print('serving at http://${server.address.host}:${server.port}');
}
