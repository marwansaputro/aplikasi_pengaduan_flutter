import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:integra_mobile/data/model/models.dart';
import 'package:integra_mobile/data/model/return_pengaduan_detail.dart';
import 'package:integra_mobile/data/provider/network/api.dart';

Future<ModelComplaintSuccess> apiCreatePengaduan({
  required String aplikasi,
  required String kantor,
  required String pengaduan,
  required DateTime tanggal,
  required File image,
}) async {
  final data = await myDio().post('/api/pengaduan',
      data: FormData.fromMap({
        "aplikasi": aplikasi,
        "kantor": kantor,
        "pengaduan": pengaduan,
        "tanggal": tanggal.toString(),
        "image": await MultipartFile.fromFile(image.path)
      }));

  if (data.statusCode == 201) {
    return ModelComplaintSuccess.fromJson(jsonDecode(data.toString()));
  }

  throw Exception('Tidak bisa membuat suatu pengaduan');
}

Future<ModelComplaintList> apiHistoryPengaduan() async {
  final data = await myDio().get('/api/pengaduan-history');

  if (data.statusCode == 200) {
    return ModelComplaintList.fromJson(jsonDecode(data.toString()));
  }

  throw Exception('Tidak bisa mendapatkan list pengaduan');
}

Future<ReturnPengaduanDetail> apiDetailPengaduan(
    {required String idPengaduan}) async {
  final data = await myDio().get('/api/pengaduan/$idPengaduan');

  if (data.statusCode == 200) {
    return ReturnPengaduanDetail.fromJson(jsonDecode(data.toString()));
  }

  throw Exception('Tidak bisa mendapatkan detail pengaduan');
}
