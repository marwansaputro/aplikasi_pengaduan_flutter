import 'package:integra_mobile/data/model/models.dart';
import 'package:integra_mobile/data/provider/network/api/api_pengaduan.dart';
import 'package:integra_mobile/data/provider/network/network.dart';

class PengaduanRepository {
  UserRepository user;

  PengaduanRepository({required this.user});

  Future<ModelComplaintSuccess> createPengaduan({
    required String aplikasi,
    required String kantor,
    required String pengaduan,
    required DateTime tanggal,
  }) {
    try {
      return apiCreatePengaduan(
          aplikasi: aplikasi,
          kantor: kantor,
          pengaduan: pengaduan,
          tanggal: tanggal);
    } catch (e) {
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
}
