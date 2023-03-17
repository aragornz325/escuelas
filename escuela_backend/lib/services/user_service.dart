import 'package:escuela_backend/repositories/user_repository.dart';

class UserService {
  final userRepository = UserRepository();

  registerUser({required String email, required String password}) async {
    return await userRepository.registerUser(email, password);
  }

  login({required String email, required String password}) async {
    return await userRepository.login(email: email, password: password);
  }
}
