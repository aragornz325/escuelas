import 'package:escuela_backend/repositories/user_repository.dart';
import 'package:escuela_backend/services/mailer_service.dart';
import 'package:escuela_backend/utility/mailer/templates/templates.dart';

class UserService {
  final templates = Templates();
  final mailer = Mailer();
  final userRepository = UserRepository();

  registerUser(
      {required String email,
      required String password,
      required int role}) async {
    await userRepository.registerUser(
        email: email, password: password, role: role);
    final mailHtml = await templates.mailRegister(userName: email);

    mailer.sendMailerFunction(
        subject: "registro completo",
        mailDestinatario: email,
        mailHtml: mailHtml);

    return {'msg': 'Usuario registrado correctamente'};
  }

  login({required String email, required String password}) async {
    return await userRepository.login(email: email, password: password);
  }
}
