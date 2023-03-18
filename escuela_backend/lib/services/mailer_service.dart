import 'dart:io';

import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

import '../utility/mailer/templates/calification_template.dart';

void main(List<String> args) async {
  await mailer(
      mailDestinatario: 'lucas.olimpi@gmail.com',
      name: 'Rodrigo',
      lastname: 'Quintero');
}

final mailHtml =
    mailCalificacions(nombreDelTutor: "juan perez", nombreAlumno: "josesito");

mailer(
    {required String mailDestinatario,
    required String name,
    required String lastname}) async {
  //TODO: pasar a variables de entorno (dotenv)
  String username = 'nidus.escuelas@gmail.com';
  String password = 'uoqmujlachjpsxkt';

  final smtpServer = gmail(username, password);

  //TODO: crear mensaje con datos de la base de datos
  final message = Message()
    ..from = Address(username, 'Nidus Escuelas')
    ..recipients.add('$mailDestinatario')
    ..ccRecipients.addAll(['rodrigo.m.quintero@gmail.com'])
    ..subject = 'su hijo ya tiene notas !!! :: 😀 :: ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
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
