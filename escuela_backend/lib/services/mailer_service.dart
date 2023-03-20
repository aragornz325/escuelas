import 'dart:io';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:dotenv/dotenv.dart';

final dotEnv = DotEnv(includePlatformEnvironment: true)..load();

class Mailer {
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

    try {
      final sendReport = await send(message, smtpServer);
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
