import 'package:dotenv/dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

final dotEnv = DotEnv(includePlatformEnvironment: true)..load();

mailer(String ccRecipient,
    {required String mailHtml, required String MailDestinatario}) async {
  String username = dotEnv['GMAIL_EMAIL']!;
  String password = dotEnv['GMAIL_PASSWORD']!;

  final finalccRecipient = ccRecipient == '' ? 'ccRecipient' : ccRecipient;

  final smtpServer = gmail(username, password);
  //TODO: crear mensaje con datos de la base de datos
  final message = Message()
    ..from = Address(username, 'Nidus Escuelas')
    ..recipients.add('$MailDestinatario')
    ..ccRecipients.addAll(['$ccRecipient'])
    ..subject = 'informe de calificaciones ${DateTime.now()}'
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
