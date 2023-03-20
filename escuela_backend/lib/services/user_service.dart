import 'package:escuela_backend/repositories/user_repository.dart';
import 'mailer_service.dart';

class UserService {
  final userRepository = UserRepository();

  registerUser(
      {required String email,
      required String password,
      required int role}) async {
    return await userRepository.registerUser(
        email: email, password: password, role: role);
  }

  login({required String email, required String password}) async {
    return await userRepository.login(email: email, password: password);
  }
}
