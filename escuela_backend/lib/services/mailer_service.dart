import 'dart:io';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:dotenv/dotenv.dart';

import 'package:escuela_backend/repositories/nota_repository.dart';

final dotEnv = DotEnv(includePlatformEnvironment: true)..load();

class MailerService {
  final notaRepository = NotaRepository();
  sendMailByDocente({
    required String idDocente,
  }) async {
    final List data =
        await notaRepository.getNotasByDocente(idDocente: idDocente);

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

  sendMailerFunction(
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
      ..ccRecipients.addAll(['rodrigo.m.quintero@gmail.com'])
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
  }
}
