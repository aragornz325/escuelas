import 'package:dotenv/dotenv.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

main() async {
  
  final dotEnv = DotEnv(includePlatformEnvironment: true)..load();

  String username = dotEnv['GMAIL_EMAIL']!;
  String password = dotEnv['GMAIL_PASSWORD']!;

  final smtpServer = gmail(username, password);

  //TODO: crear mensaje con datos de la base de datos
  final message = Message()
    ..from = Address(username, 'Nidus Escuelas')
    ..recipients.add('rodrigo.m.quintero@gmail.com')
    ..ccRecipients.addAll(['juanjgar998@gmail.com'])
    ..subject = 'su hijo ya tiene notas !!! :: 😀 :: ${DateTime.now()}'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html =
        "<h1>con adjunto</h1>\n<p>hola, su hijo pepito tiene las siguientes notas</p><br>\n <table>\n <tr>\n <th>Asignatura</th>\n <th>Nota</th>\n </tr>\n <tr>\n <td>Matematicas</td>\n <td>4.5</td>\n </tr>\n <tr>\n <td>Ingles</td>\n <td>3.5</td>\n </tr>\n <tr>\n <td>Programacion</td>\n <td>5.0</td>\n </tr>\n </table> ";
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
