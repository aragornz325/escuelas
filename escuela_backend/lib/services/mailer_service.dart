import 'dart:io';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:dotenv/dotenv.dart';

import 'package:escuela_backend/repositories/nota_repository.dart';

import 'package:escuela_backend/utility/mailer/templates/templates.dart';

final dotEnv = DotEnv(includePlatformEnvironment: true)..load();

class MailerService {
  final templates = Templates();
  final notaRepository = NotaRepository();

  Future<Map<String, String>> sendMailByDocente({
    required String idDocente,
  }) async {
    final List data =
        await notaRepository.getNotasByDocente(idDocente: idDocente);
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
    final List data = await notaRepository.getNotasByCurso(idCurso: idCurso);
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
      final mailHtmlFinal = templates.mailcalificaciones(
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

  ///esta funcion envia el mail
  ///crea la coneccion con el servidor de gmail
  ///se le debe enviar el destinatario, el asunto y el cuerpo del mail
  Future<Map<String, String>> sendMailerFunction(
      {required String mailDestinatario,
      required String subject,
      required String mailHtml}) async {
    //TODO: pasar a variables de entorno (dotenv)
    String username = dotEnv['GMAIL_EMAIL']!;
    String password = dotEnv['GMAIL_PASSWORD']!;
    final smtpServer = gmail(username, password);
    //final finalccRecipients = ccRecipient ?? 'nidus.escuelas@gmail.com';
    //TODO: crear mensaje con datos de la base de datos
    final message = Message()
      ..from = Address(username, 'Nidus Escuelas')
      ..recipients.add('$mailDestinatario')
      //..ccRecipients.addAll(['rodrigo.m.quintero@gmail.com'])
      ..subject = ' $subject -  ${DateTime.now()}'
      ..html = mailHtml;

    // ..attachments = [
    //   FileAttachment(File(''))
    //     ..location = Location.inline   //todo: revisar envio de adjuntos
    //     ..cid = '<myimg@3.141>'
    // ];
    const duration = Duration(minutes: 3, seconds: 12);

    try {
      final sendReport = await send(
        message,
        smtpServer,
        timeout: duration,
      );
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }

    var connection = PersistentConnection(smtpServer);

    // Send the first message
    await connection.send(message);

    // close the connection
    await connection.close();
    return {'status': 'ok'};
  }
}
