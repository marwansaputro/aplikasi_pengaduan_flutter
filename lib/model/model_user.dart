import 'package:json_annotation/json_annotation.dart';

part 'model_user.g.dart';

@JsonSerializable()
class ModelUser {
  ModelUser({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.email,
    required this.emailVerifiedAt,
    required this.updatedAt,
  });

  final int id;
  final String name;
  final String email;
  @JsonKey(name: 'email_verified_at')
  final String emailVerifiedAt;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;

  factory ModelUser.fromJson(Map<String, dynamic> json) =>
      _$ModelUserFromJson(json);

  Map<String, dynamic> toJson() => _$ModelUserToJson(this);
}
