import 'package:escuela_backend/repositories/user_repository.dart';
import 'package:escuela_backend/services/mailer_service.dart';
import 'package:escuela_backend/utility/mailer/templates/templates.dart';
import 'package:escuela_backend/utility/mailer/mail.dart';

class UserService {
  final _templates = Templates();
  final _mailer = MailerService();
  final _userRepository = UserRepository();

  registerUser(
      {required String email,
      required String password,
      required int role}) async {
    await _userRepository.registerUser(
        email: email, password: password, role: role);
    final mailHtml = await _templates.mailRegister(userName: email);

    sendMailerFunction(
        subject: "registro completo",
        mailDestinatario: email,
        mailHtml: mailHtml);

    return {'msg': 'Usuario registrado correctamente'};
  }

  login({required String email, required String password}) async {
    return await _userRepository.login(email: email, password: password);
  }
}
