import 'package:integra_mobile/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_notification.g.dart';

@JsonSerializable()
class ModelNotification {
  final String id;
  final String payload;
  final String tanggal;
  @JsonKey(name: 'user_id')
  final int userId;
  @JsonKey(name: 'pengaduan_id')
  final String pengaduanId;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final String title;
  final String body;

  ModelComplaint? pengaduan;

  ModelNotification(
      {required this.id,
      required this.payload,
      required this.tanggal,
      required this.userId,
      required this.pengaduanId,
      required this.createdAt,
      required this.updatedAt,
      required this.title,
      required this.body,
      this.pengaduan});

  factory ModelNotification.fromJson(Map<String, dynamic> json) =>
      _$ModelNotificationFromJson(json);

  Map<String, dynamic> toJson() => _$ModelNotificationToJson(this);
}
