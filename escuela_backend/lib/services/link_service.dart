import 'dart:io';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:escuela_backend/utility/mailer/templates/templates.dart';

import 'package:escuela_backend/repositories/asignatura_repository.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

import 'package:escuela_backend/utility/mailer/templates/templates.dart';
import 'package:escuela_backend/services/mailer_service.dart';

class LinkService {
  final templates = Templates();
  final mailerService = MailerService();
  final asignaturaRepository = AsignaturaRepository();
  sendLinkCalificacion({required String idAsignatura}) async {
    final asignatura =
        await asignaturaRepository.getAsignaturaById(idAsignatura);
    final jwt = JWT({
      "docente": asignatura['docente']['idDocente'],
      "asignatura": asignatura['idAsignatura'],
      "exp": DateTime.now().add(Duration(days: 2)).millisecondsSinceEpoch
    });

    final token = jwt.sign(SecretKey(
        'unodoskey')); //TODO poner una key secreta como la gente y pasarla por el .env

    final html = templates.pedidoCalificaciones(
        nombre: asignatura['docente']['nombre'],
        apellido: asignatura['docente']['apellido'],
        link: 'https://google.com/?token=$token');

    final response = mailerService.sendMailerFunction(
        mailDestinatario: asignatura['docente']['email'],
        subject: 'pedido de calificaciones',
        mailHtml: html);

    return {'mensaje': 'se envio el mail'};
  }
}
