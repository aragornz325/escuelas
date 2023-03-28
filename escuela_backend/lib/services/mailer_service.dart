import 'dart:io';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:dotenv/dotenv.dart';

import 'package:escuela_backend/repositories/calificaciones_repository.dart';

import 'package:escuela_backend/utility/mailer/templates/templates.dart';
import 'package:escuela_backend/utility/mailer/mail.dart';
import 'package:escuela_backend/services/link_service.dart';

final dotEnv = DotEnv(includePlatformEnvironment: true)..load();

class MailerService {
  //final _linkService = LinkService();
  final _templates = Templates();
  final _calificacionesRepository = CalificacionesRepository();

  //esta funcion envia el mail con las calificaciones de los alumnos por docente
  //recibe como parametro el id del docente y algo mas
  Future<Map<String, String>> sendMailByDocente({
    required String idDocente,
  }) async {
    final List data = await _calificacionesRepository
        .getCalificacionesByDocente(idDocente: idDocente);
    if (data.isEmpty) {
      throw Exception('No hay notas para enviar');
    }
    data.forEach((element) async {
      final mailDestinatario = element['email'];
      final subject = 'Notas de ${element['nombre']} ${element['apellido']}';
      final mailHtml =
          '<h1>Notas de ${element['nombre']} ${element['apellido']}</h1>';
      final listadoNotas = element['notas'].map((nota) {
        return '<p>Asignatura: ${nota['asignatura']} - Curso: ${nota['curso']} - Division: ${nota['division']} - Nota: ${nota['nota']}</p>';
      }).join();
      await sendMailerFunction(
          mailDestinatario: mailDestinatario,
          subject: subject,
          mailHtml: listadoNotas);
    });
    return {'status': 'ok'};
  }

  ///esta funcion envia el mail con las calificaciones de los alumnos por curso
  ///recibe como parametro el id del curso y algo mas

  Future<Map<String, String>> sendMailByCurso({
    required String idCurso,
  }) async {
    final List data = await _calificacionesRepository.getCalificacionesByCurso(
        idCurso: idCurso);
    if (data.isEmpty) {
      throw Exception('No hay notas para enviar');
    }
    data.forEach((element) async {
      final mailDestinatario = element['email'];
      final subject =
          'Notas de ${element['nombre']} ${element['apellido']} - curso: ${element['notas'][0]['curso']}';
      final mailHtml =
          '<h1>Notas de ${element['nombre']} ${element['apellido']}</h1>';
      final listadoNotas = element['notas'].map((nota) {
        return ' <tr> <td style="border: solid"> ${nota['asignatura']} </td>  <td style="border: solid"> ${nota['nota']}</td></tr>';
      }).join();

      final tableCalificaciones =
          '<table style="cellpadding: 5px"> <thead> <tr> <td> ASIGNATURA </td> <td> NOTA</td>  <tr></thead> <tbody> <tr> $listadoNotas </tr></tbody> </table>';
      final mailHtmlFinal = _templates.mailcalificaciones(
          nombre: element['nombre'],
          apellido: element['apellido'],
          tableCalificaciones: tableCalificaciones);

      await sendMailerFunction(
          mailDestinatario: mailDestinatario,
          subject: subject,
          mailHtml: mailHtmlFinal);
    });
    return {'status': 'ok'};
  }

  Future<String> sendMailByPeriodo({required String periodo}) async {
    // final List data = await _linkService.getLinksByPeriodo(periodo);

    // final List alert = [];
    // for (int i = 0; i < data.length; i++) {
    //   if (data[i].notasCargadas == false) {
    //     alert.add(
    //         'no se pueden enviar las notas porque el docente ${data[i].docente.nombre} ${data[i].docente.apellido} aun no envio las notas del periodo');
    //   }
    // }
    // if (alert.isNotEmpty) {
    //   throw Exception(alert);
    // }
    // final notasByPeriodo = await _calificacionesRepository
    //     .getCalificacionesByPeriodo(periodo: periodo);

    return 'ok';
  }
}
