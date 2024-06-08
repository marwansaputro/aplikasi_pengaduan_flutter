import 'package:integra_mobile/domain/entities/entities.dart';
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
