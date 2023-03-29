import 'dart:io';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:collection/collection.dart';

import 'package:escuela_backend/services/link_service.dart';
import 'package:shelf_router/shelf_router.dart';

class LinkController {
  final linkService = LinkService();

  Future<Response> sendLinkByAsignatura(Request request) async {
    try {
      final idAsignatura = request.params['idAsignatura'];
      final now = DateTime.now();
      final periodo =
          request.url.queryParameters['periodo'] ?? '${now.month}/${now.year}';
      final response = await linkService.sendLinkCalificacion(
          idAsignatura: idAsignatura!, periodo: periodo);
      final encodeResponsee = jsonEncode(response);
      return Response.ok(encodeResponsee,
          headers: {'content-type': 'application/json'});
    } catch (e) {
      return Response.badRequest(body: e.toString().split(':').last);
    }
  }

  Future<Response> sendAlumnosByToken(Request request) async {
    try {
      final token = request.params['token']!;
      final response = await linkService.sendAlumnosByToken(token);
      final encodeResponsee = jsonEncode(response);
      return Response.ok(encodeResponsee,
          headers: {'content-type': 'application/json'});
    } catch (e) {
      return Response.badRequest(body: e.toString().split(':').last);
    }
  }
}
