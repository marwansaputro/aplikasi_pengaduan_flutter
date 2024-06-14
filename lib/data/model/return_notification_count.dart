import 'package:integra_mobile/data/model/return_message.dart';
import 'package:json_annotation/json_annotation.dart';

part 'return_notification_count.g.dart';

@JsonSerializable()
class ReturnNotificationCount extends ReturnMessage {
  final int data;

  ReturnNotificationCount({required super.meta, required this.data});

  factory ReturnNotificationCount.fromJson(Map<String, dynamic> json) =>
      _$ReturnNotificationCountFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReturnNotificationCountToJson(this);
}
