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

      final encodeResponse = jsonEncode(response);
      return Response.ok(encodeResponse,
          headers: {'content-type': 'application/json'});
    } catch (e) {
      return e.toString();
    }
  }

  login(Request request) async {
    try {
      final json = request.context['body'] as Map<String, dynamic>;
      final email = json['email'];
      final password = json['password'];

      final response =
          await userService.login(email: email, password: password);
      final encodeResponse = jsonEncode(response);
      return Response.ok(encodeResponse,
          headers: {'content-type': 'application/json'});
    } catch (e) {
      return e.toString();
    }
  }
}
