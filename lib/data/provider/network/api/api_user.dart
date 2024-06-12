import 'dart:convert';

import 'package:integra_mobile/data/model/return_message.dart';
import 'package:integra_mobile/data/provider/network/api.dart';

Future<ReturnMessage> apiUpdateUserName({required String name}) async {
  final data = await myDio().put('/api/user-change-name', data: {
    'name': name,
  });

  if (data.statusCode == 201) {
    return ReturnMessage.fromJson(jsonDecode(data.toString()));
  }

  throw Exception('Tidak berhasil merubah nama user');
}

Future<ReturnMessage> apiUpdateHandphone({required String phoneNumber}) async {
  final data = await myDio().put('/api/user-change-handphone', data: {
    'phone_number': phoneNumber,
  });

  if (data.statusCode == 201) {
    return ReturnMessage.fromJson(jsonDecode(data.toString()));
  }

  throw Exception('Tidak berhasil merubah handphone dari user');
}
