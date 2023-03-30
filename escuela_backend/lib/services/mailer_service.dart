import 'dart:io';
import 'package:dotenv/dotenv.dart';

import 'package:escuela_backend/repositories/calificaciones_repository.dart';
import 'package:escuela_backend/utility/mailer/templates/templates.dart';
import 'package:escuela_backend/utility/mailer/mail.dart';

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
      final mailHtmlFinal = _templates.calificacionesSimple(
          nombre: element['nombre'],
          apellido: element['apellido'],
          notaTable: tableCalificaciones,
          periodo: element['notas'][0]['periodo']);

      await sendMailerFunction(
          mailDestinatario: mailDestinatario,
          subject: subject,
          mailHtml: mailHtmlFinal);
    });
    return {'status': 'ok'};
  }

  Future<String> sendMailByPeriodo({required String periodo}) async {
    final List data =
        await _calificacionesRepository.getLinksByPeriodo(periodo);

    final List alert = [];
    for (int i = 0; i < data.length; i++) {
      if (data[i]["notasCargadas"] == false) {
        alert.add(
            'el profesor ${data[i]['Docente']["nombre"]} ${data[i]['Docente']["apellido"]} no cargo las notas del periodo $periodo');
      }
    }
    if (alert.isNotEmpty) {
      throw Exception(alert.join(' - '));
    }

    final calificacionesEnviar = await _calificacionesRepository
        .getCalificacionesByPeriodo(periodo: periodo);

    for (int i = 0; i < calificacionesEnviar.length; i++) {
      final mailDestinatario = calificacionesEnviar[i]['email'];
      final subject =
          'Notas de ${calificacionesEnviar[i]['nombre']} ${calificacionesEnviar[i]['apellido']} - curso: ${calificacionesEnviar[i]['curso']}';
      final mailHtml =
          '<h1>Notas de ${calificacionesEnviar[i]['nombre']} ${calificacionesEnviar[i]['apellido']}</h1>';
      final listadoNotas = calificacionesEnviar[i]['notas'].map((nota) {
        return ' <tr> <td style="border: dotted 1px"> ${nota['NombreAsignatura']} </td>  <td style="border: solid 1px; background-color: #2E75FF "> ${nota['nota']}</td></tr>';
      }).join();

      final tableCalificaciones =
          '<h4> periodo ${calificacionesEnviar[i]['notas'][0]['periodo']} </h4><table style="cellpadding: 5px; margin: 0 auto; text-align: center; border: #817fee77 solid; "> <thead> <tr> <td> ASIGNATURA </td> <td> NOTA</td>  <tr></thead> <tbody> <tr> $listadoNotas </tr></tbody> </table>';
      final mailHtmlFinal = _templates.calificacionesSimple(
          nombre: calificacionesEnviar[i]['nombre'],
          apellido: calificacionesEnviar[i]['apellido'],
          notaTable: tableCalificaciones,
          periodo: calificacionesEnviar[i]['notas'][0]['periodo']);

      await sendMailerFunction(
          mailDestinatario: mailDestinatario,
          subject: subject,
          mailHtml: mailHtmlFinal);

      const payload = {
        'sentByMail': true,
      };

      final notasList = calificacionesEnviar[i]['notas'];

      for (int i = 0; i < notasList.length; i++) {
        final idNota = notasList[i]['idNota'];
        await _calificacionesRepository.updateNota(
            payload: payload, idNota: idNota);
      }
    }
    return 'todo ok';
  }
}
