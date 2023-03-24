import 'dart:io';
import 'dart:convert';
import 'package:shelf/shelf.dart';
import 'package:collection/collection.dart';

import 'package:escuela_backend/services/mailer_service.dart';
import 'package:shelf_router/shelf_router.dart';

class MailerController {
  final mailerService = MailerService();

  Future<Response> sendMailByDocente(Request request, id) async {
    try {
      final id = request.params['id'];
      final response = await mailerService.sendMailByDocente(idDocente: id!);

      final encodeResponse = jsonEncode(response);
      return Response.ok(encodeResponse,
          headers: {'content-type': 'application/json'});
    } catch (e) {
      return Response.badRequest(body: e.toString().split(':').last);
    }
  }

  Future<Response> sendMailByCurso(Request request, id) async {
    try {
      final id = request.params['id'];
      final response = await mailerService.sendMailByCurso(idCurso: id!);

      final encodeResponse = jsonEncode(response);
      return Response.ok(encodeResponse,
          headers: {'content-type': 'application/json'});
    } catch (e) {
      return Response.badRequest(body: e.toString().split(':').last);
    }
  }
}
