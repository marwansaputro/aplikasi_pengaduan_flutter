import 'dart:convert';

import 'package:integra_mobile/data/model/models.dart';
import 'package:integra_mobile/data/model/return_reset_password.dart';
import 'package:integra_mobile/domain/entities/entities.dart';
import 'package:integra_mobile/data/provider/network/api.dart';

Future<ModelUser> apiUserProfile() async {
  final data = await myDio().get('/api/auth/user-profile');

  if (data.statusCode == 200) {
    return ModelUser.fromJson(jsonDecode(data.toString()));
  }

  throw Exception('Tidak bisa mendapatkan data user');
}

Future<ModelSuccessLogin> apiLogin({
  required String email,
  required String password,
}) async {
  final data = await myDio().post('/api/auth/login', data: {
    "email": email,
    "password": password,
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
  final data = await myDio().post('/api/auth/register', data: {
    "name": name,
    "email": email,
    "password": password,
  });

  if (data.statusCode == 201) {
    return ModelRegistrationSuccess.fromJson(jsonDecode(data.toString()));
  }

  throw Exception('Tidak bisa login');
}

Future<ReturnResetPassord> apiResetPassword({required String email}) async {
  final data =
      await myDio().post('/api/auth/forgot-password', data: {"email": email});

  if (data.statusCode == 200) {
    return ReturnResetPassord.fromJson(jsonDecode(data.toString()));
  }

  throw Exception("Tidak bisa mendapatkan reset password");
}
