import 'base_repository.dart';

class UserRepository extends Repository {

  registerUser(
      {required String email,
      required String password,
      required int role}) async {
    try {
      final response = await client.auth
          .signUp(email, password, userMetadata: {"role": role});
      if (response.error != null) {
        return {
          "error": response.error?.message,
        };
      } else {
        return response.user?.toJson();
      }
    } catch (e) {
      return e;
    }
  }

  login({required String email, required String password}) async {
    try {
      final response =
          await client.auth.signIn(email: email, password: password);
      if (response.error != null) {
        return {
          "error": response.error?.message,
        };
      }
      final finalResponse = {
        "accessToken": response.data?.accessToken,
        "refreshToken": response.data?.refreshToken,
      };
      return finalResponse;
    } catch (e) {
      return e;
    }
  }
}
