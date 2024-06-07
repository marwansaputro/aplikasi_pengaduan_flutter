import 'package:integra_mobile/model/model_complaint_list.dart';
import 'package:integra_mobile/model/model_complaint_success.dart';
import 'package:integra_mobile/share/network/api/api_pengaduan.dart';

class PengaduanRepository {
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
