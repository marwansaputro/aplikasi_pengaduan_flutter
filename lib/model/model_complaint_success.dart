import 'package:json_annotation/json_annotation.dart';

part 'model_complaint_success.g.dart';

@JsonSerializable()
class ModelComplaintSuccess {
  final bool success;
  @JsonKey(name: 'last_insert_id')
  final String lastInsertedId;
  final ModelComplaint data;

  ModelComplaintSuccess(
      {required this.success,
      required this.lastInsertedId,
      required this.data});

  factory ModelComplaintSuccess.fromJson(Map<String, dynamic> json) =>
      _$ModelComplaintSuccessFromJson(json);

  Map<String, dynamic> toJson() => _$ModelComplaintSuccessToJson(this);
}

@JsonSerializable()
class ModelComplaint {
  final String id;
  final String nama;
  @JsonKey(name: 'isi_pengaduan')
  final String isiPengaduan;
  @JsonKey(name: 'status_pengaduan')
  final String statusPengaduan;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'tanggal_pengaduan')
  final String tanggalPengaduan;
  final String aplikasi;
  final String kantor;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'created_at')
  final String createdAt;

  ModelComplaint(
      {required this.id,
      required this.nama,
      required this.isiPengaduan,
      required this.statusPengaduan,
      required this.userId,
      required this.tanggalPengaduan,
      required this.aplikasi,
      required this.kantor,
      required this.updatedAt,
      required this.createdAt});

  factory ModelComplaint.fromJson(Map<String, dynamic> json) =>
      _$ModelComplaintFromJson(json);

  Map<String, dynamic> toJson() => _$ModelComplaintToJson(this);
}
