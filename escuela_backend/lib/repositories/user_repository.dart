import 'package:supabase/supabase.dart';

class UserRepository {
  final client = SupabaseClient('https://rlsbqzngalrkrzijpnjy.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJsc2Jxem5nYWxya3J6aWpwbmp5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3Mzc5ODM5NSwiZXhwIjoxOTg5Mzc0Mzk1fQ.1Z_7PSi0duNogmYUrvb7QfnJgtqt37A3qK6dYOCGTmk');

  registerUser(
      {required String email,
      required String password,
      required String role}) async {
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
