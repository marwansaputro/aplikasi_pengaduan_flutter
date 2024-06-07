import 'dart:convert';

import 'package:integra_mobile/model/model_complaint_list.dart';
import 'package:integra_mobile/model/model_complaint_success.dart';
import 'package:integra_mobile/share/network/api.dart';

Future<ModelComplaintSuccess> apiCreatePengaduan({
  required String aplikasi,
  required String kantor,
  required String pengaduan,
  required DateTime tanggal,
}) async {
  final data = await myDio().post('/pengaduan', data: {
    "aplikasi": aplikasi,
    "kantor": kantor,
    "pengaduan": pengaduan,
    "tanggal": tanggal.toString()
  });

  if (data.statusCode == 201) {
    return ModelComplaintSuccess.fromJson(jsonDecode(data.toString()));
  }

  throw Exception('Tidak bisa login');
}

Future<ModelComplaintList> apiHistoryPengaduan() async {
  final data = await myDio().get('/pengaduan-history');

  if (data.statusCode == 200) {
    return ModelComplaintList.fromJson(jsonDecode(data.toString()));
  }

  throw Exception('Tidak bisa login');
}
