import 'package:supabase/supabase.dart';

class UserRepository {
  final client = SupabaseClient('https://rlsbqzngalrkrzijpnjy.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJsc2Jxem5nYWxya3J6aWpwbmp5Iiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTY3Mzc5ODM5NSwiZXhwIjoxOTg5Mzc0Mzk1fQ.1Z_7PSi0duNogmYUrvb7QfnJgtqt37A3qK6dYOCGTmk');

  registerUser(String email, String password) async {
    try {
      final response = await client.auth.signUp(email, password);
      if (response.error != null) {
        throw Exception('usuario ya existe');
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
      final finalResponse = {
        "accsesToken": response.data?.accessToken,
        "refreshToken": response.data?.refreshToken,
        "user": response.user?.toJson()
      };
      return finalResponse;
    } catch (e) {
      return e;
    }
  }
}
