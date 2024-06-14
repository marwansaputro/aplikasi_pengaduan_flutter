import 'dart:io';

import 'package:integra_mobile/data/provider/network/api/api_user.dart';
import 'package:integra_mobile/data/provider/network/network.dart';

class UserRepository {
  UserRepository({required this.authRepository});

  final AuthRepository authRepository;

  updateName({required String name}) async {
    try {
      final data = await apiUpdateUserName(name: name);

      authRepository.userProfile();

      return data;
    } catch (e) {
      rethrow;
    }
  }

  updateHandphone({required String handphone}) async {
    try {
      final data = await apiUpdateHandphone(phoneNumber: handphone);

      authRepository.userProfile();

      return data;
    } catch (e) {
      rethrow;
    }
  }

  updateImageProfile({required File image}) async {
    try {
      final data = await apiUpdateChangeImageProfile(image: image);
      authRepository.userProfile();

      return data;
    } catch (e) {
      rethrow;
    }
  }

  updatePassword(
      {required String newPassword, required String oldPassword}) async {
    try {
      final data = await apiUpdatePasssword(
          newPassword: newPassword, oldPassword: oldPassword);
      authRepository.userProfile();

      return data;
    } catch (e) {
      rethrow;
    }
  }
}
