import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:my_unhas_new/dtos/login_request.dart';
import 'package:my_unhas_new/services/auth_service.dart';
import 'package:my_unhas_new/services/basic_client.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  var authService = AuthService();

  var usernameEditingController = TextEditingController();
  var passwordEditingController = TextEditingController();

  var passwordVisible = false.obs;
  var isAttempt = false.obs;

  var accessToken = "".obs;

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  bool isValidUsername(String? username) {
    if (username == null) {
      return false;
    }
    return username.length >= 6;
  }

  bool isValidPassword(String? password) {
    if (password == null) {
      return false;
    }
    return password.length >= 6;
  }

  Future<List<String>> login() async {
    var errors = <String>[];
    isAttempt.value = true;
    var username = usernameEditingController.text;
    var password = passwordEditingController.text;

    var loginRequest = LoginRequest(username: username, password: password);
    http.Response response;
    try {
      response = await authService.login(loginRequest);

      if (response.statusCode == 200) {
        print("body ${response.body}");
        var responseBody = jsonDecode(response.body);
        TokenManager.setAccessToken(responseBody["access_token"]);
        TokenManager.setRefreshToken(responseBody["refresh_token"]);
        Get.offAllNamed("/homescreen-mahasiswa");
        Get.delete<LoginController>();
      } else {
        var responseBody = jsonDecode(response.body);
        var message = responseBody["message"];
        errors.add(message);
      }
    } catch (e) {
      print("error");
      errors.add('Error');
      print(e.toString());
    }

    isAttempt.value = false;
    return errors;
  }

  List<String> validate() {
    isAttempt.value = false;
    var errors = <String>[];
    var username = usernameEditingController.text;
    var password = passwordEditingController.text;

    if (usernameEditingController.text.isEmpty) {
      errors.add('username tidak boleh kosong');
    }

    if (passwordEditingController.text.isEmpty) {
      errors.add('password tidak boleh kosong');
    }

    if (errors.isNotEmpty) return errors;

    if (!isValidUsername(username)) {
      errors.add("username tidak valid");
    }
    if (!isValidPassword(password)) {
      errors.add("password harus lebih dari 6 karakter");
    }

    isAttempt.value = false;

    return errors;
  }
}
