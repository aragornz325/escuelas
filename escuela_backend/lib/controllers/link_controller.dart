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
      final response =
          await linkService.sendLinkCalificacion(idAsignatura: idAsignatura!);
      final encodeResponsee = jsonEncode(response);
      return Response.ok(encodeResponsee,
          headers: {'content-type': 'application/json'});
    } catch (e) {
      return Response.badRequest(body: e.toString());
    }
  }

  Future<Response> sendAlumnosByAsignatura(Request request, token) async {
    try {
      final response = await linkService.sendAlumnosByAsignatura(token);
      final encodeResponsee = jsonEncode(response);
      return Response.ok(encodeResponsee,
          headers: {'content-type': 'application/json'});
    } catch (e) {
      return Response.badRequest(body: e.toString());
    }
  }
}
