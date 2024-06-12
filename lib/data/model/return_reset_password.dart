import 'package:json_annotation/json_annotation.dart';

part 'return_reset_password.g.dart';

@JsonSerializable()
class ReturnResetPassord {
  final int status;
  final String message;

  ReturnResetPassord({required this.status, required this.message});

  factory ReturnResetPassord.fromJson(Map<String, dynamic> json) =>
      _$ReturnResetPassordFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnResetPassordToJson(this);
}
