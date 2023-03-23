import 'dart:io';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:escuela_backend/utility/mailer/templates/templates.dart';
import 'package:dotenv/dotenv.dart';
import 'package:escuela_backend/repositories/asignatura_repository.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import 'package:escuela_backend/utility/mailer/templates/templates.dart';
import 'package:escuela_backend/services/mailer_service.dart';

class LinkService {
  final templates = Templates();
  final mailerService = MailerService();
  final asignaturaRepository = AsignaturaRepository();

  final dotEnv = DotEnv(includePlatformEnvironment: true)..load();

  Future<Map<String, String>> sendLinkCalificacion(
      {required String idAsignatura}) async {
    final asignatura =
        await asignaturaRepository.getAsignaturaById(idAsignatura);
    if (asignatura == null) {
      throw Exception('No se encontro la asignatura');
    }
    final jwt = JWT({
      "docente": asignatura['docente']['idDocente'],
      "asignatura": asignatura['idAsignatura'],
      "exp": DateTime.now().add(Duration(days: 2)).millisecondsSinceEpoch
    });

    final token = jwt.sign(SecretKey(
        dotEnv['JWT_TOKEN']!));

    final html = templates.pedidoCalificaciones(
        nombre: asignatura['docente']['nombre'],
        apellido: asignatura['docente']['apellido'],
        link: 'https://google.com/?token=$token');
    if (html == null) {
      throw Exception('No se pudo generar el html');
    }
    final response = mailerService.sendMailerFunction(
        mailDestinatario: asignatura['docente']['email'],
        subject: 'pedido de calificaciones',
        mailHtml: html);

    return {'status': 'ok'};
  }
}
