import 'dart:io';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:collection/collection.dart';

import 'package:escuela_backend/services/link_service.dart';
import 'package:shelf_router/shelf_router.dart';

class LinkController {
  final linkService = LinkService();

  Future<Response> sendLinkByAsignatura(Request request, id) async {
    try {
      final idAsignatura = request.params['idAsignatura'];
      print('en el controller entrando al servicio');
      final response =
          await linkService.sendLinkCalificacion(idAsignatura: idAsignatura!);
      final encodeResponse = jsonEncode(response);
      return Response.ok(encodeResponse,
          headers: {'content-type': 'application/json'});
    } catch (e) {
      return Response.badRequest(body: e.toString());
    }
  }
}
