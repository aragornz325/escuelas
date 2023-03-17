import 'dart:convert';
import 'dart:io';

import 'package:escuela_backend/services/user_service.dart';

import 'package:shelf/shelf.dart';
import 'package:collection/collection.dart';

import '../class/result.dart';

class UserController {
  final userService = UserService();

  registerUser(Request request) async {
    try {
      final json = request.context['body'] as Map<String, dynamic>;
      final email = json['email'];
      final password = json['password'];

      final response =
          await userService.registerUser(email: email, password: password);

      final result = {
        'access_token': response.data?.accessToken,
        'refresh_token': response.data?.refreshToken,
        'expires_at': response.data?.expiresAt?.toIso8601String(),
        'user_id': response.data?.user?.id,
        'user_email': response.data?.user?.email,
        // Agrega otros campos relevantes del objeto GotrueSessionResponse aquí
      };

      final encodeResponse = jsonEncode(result);
      return Response.ok(encodeResponse,
          headers: {'content-type': 'application/json'});
    } catch (e) {
      return Response.internalServerError(body: e.toString());
    }
  }
}
