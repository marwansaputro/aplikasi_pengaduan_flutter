import 'package:json_annotation/json_annotation.dart';

part 'model_pengaduan.g.dart';

enum StatusPengaduan {
  @JsonValue('incoming')
  incoming,
  @JsonValue('process')
  process,
  @JsonValue('reject')
  reject,
  @JsonValue('success')
  success,
}

@JsonSerializable()
class ModelComplaint {
  final String id;
  final String nama;
  @JsonKey(name: 'isi_pengaduan')
  final String isiPengaduan;
  @JsonKey(name: 'status_pengaduan')
  final StatusPengaduan statusPengaduan;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'tanggal_pengaduan')
  final String tanggalPengaduan;
  final String aplikasi;
  final String kantor;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'created_at')
  final String? createdAt;

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
