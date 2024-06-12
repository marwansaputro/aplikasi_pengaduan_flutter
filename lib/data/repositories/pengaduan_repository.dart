import 'dart:io';

import 'package:dio/dio.dart';
import 'package:integra_mobile/data/model/models.dart';
import 'package:integra_mobile/data/model/return_pengaduan_detail.dart';
import 'package:integra_mobile/data/provider/network/network.dart';

class PengaduanRepository {
  AuthRepository user;

  PengaduanRepository({required this.user});

  Future<ModelComplaintSuccess> createPengaduan({
    required String aplikasi,
    required String kantor,
    required String pengaduan,
    required DateTime tanggal,
    required File image,
  }) {
    try {
      return apiCreatePengaduan(
          aplikasi: aplikasi,
          kantor: kantor,
          pengaduan: pengaduan,
          tanggal: tanggal,
          image: image);
    } catch (e) {
      if (e is DioException) {
        if (e.response?.statusCode == 401) {
          user.logOut();
        }
      }
      rethrow;
    }
  }

  Future<ModelComplaintList> listHistory() {
    try {
      return apiHistoryPengaduan();
    } catch (e) {
      rethrow;
    }
  }

  Future<ReturnPengaduanDetail> detail({
    required String idPengaduan,
  }) {
    try {
      return apiDetailPengaduan(idPengaduan: idPengaduan);
    } catch (e) {
      rethrow;
    }
  }
}
