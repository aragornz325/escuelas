import 'dart:io';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:collection/collection.dart';

import 'package:escuela_backend/services/calificacion_service.dart';
import 'package:shelf_router/shelf_router.dart';

class CalificacionController {
  final calificacionService = CalificacionService();

  Future<Response> createCalificacionInBash(Request request) async {
    try {
      final body = jsonEncode(request.context['body']);
      final payload = jsonDecode(body);
      final response =
          await calificacionService.createCalificacionInBash(payload: payload);
      final encodeResponsee = jsonEncode(response);
      return Response.ok(encodeResponsee,
          headers: {'content-type': 'application/json'});
    } catch (e) {
      return Response.badRequest(body: e.toString().split(':').last);
    }
  }
}
