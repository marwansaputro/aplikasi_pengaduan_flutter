import 'dart:convert';

import 'package:integra_mobile/model/model_registration_success.dart';
import 'package:integra_mobile/model/success_login.dart';
import 'package:integra_mobile/network/api.dart';

Future<ModelSuccessLogin> login({
  required String email,
  required String password,
}) async {
  final data = await myDio().post('/auth/login', data: {
    email: email,
    password: password,
  });

  if (data.statusCode == 200) {
    return ModelSuccessLogin.fromJson(jsonDecode(data.toString()));
  }

  throw Exception('Tidak bisa login');
}

Future<ModelRegistrationSuccess> apiRegister({
  required String name,
  required String email,
  required String password,
}) async {
  final data = await myDio().post('/auth/register', data: {
    "name": name,
    "email": email,
    "password": password,
  });

  if (data.statusCode == 201) {
    return ModelRegistrationSuccess.fromJson(jsonDecode(data.toString()));
  }

  throw Exception('Tidak bisa login');
}
