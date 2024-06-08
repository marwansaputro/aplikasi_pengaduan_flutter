import 'package:integra_mobile/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_registration_success.g.dart';

@JsonSerializable()
class ModelRegistrationSuccess {
  ModelRegistrationSuccess({this.message, this.user});

  final String? message;
  final ModelUser? user;

  factory ModelRegistrationSuccess.fromJson(Map<String, dynamic> json) =>
      _$ModelRegistrationSuccessFromJson(json);

  Map<String, dynamic> toJson() => _$ModelRegistrationSuccessToJson(this);
}
