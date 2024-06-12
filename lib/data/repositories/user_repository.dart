import 'dart:io';

import 'package:integra_mobile/data/provider/network/api/api_user.dart';
import 'package:integra_mobile/data/provider/network/network.dart';

class UserRepository {
  UserRepository({required this.authRepository});

  final AuthRepository authRepository;

  updateName({required String name}) {
    try {
      return apiUpdateUserName(name: name);
    } catch (e) {
      rethrow;
    }
  }

  updateHandphone({required String handphone}) {
    try {
      return apiUpdateHandphone(phoneNumber: handphone);
    } catch (e) {
      rethrow;
    }
  }

  updateImageProfile({required File image}) {
    try {
      return apiUpdateChangeImageProfile(image: image);
    } catch (e) {
      rethrow;
    }
  }
}
