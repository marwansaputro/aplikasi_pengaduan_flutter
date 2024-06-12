import 'package:json_annotation/json_annotation.dart';

part 'return_message.g.dart';

@JsonSerializable()
class ReturnMessage {
  final Meta meta;

  ReturnMessage({required this.meta});

  factory ReturnMessage.fromJson(Map<String, dynamic> json) =>
      _$ReturnMessageFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnMessageToJson(this);
}

@JsonSerializable()
class Meta {
  final int code;
  final String message;

  Meta({required this.code, required this.message});

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
