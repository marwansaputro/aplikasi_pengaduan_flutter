import 'package:integra_mobile/domain/entities/entities.dart';
import 'package:integra_mobile/domain/entities/model_notification.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_notification_list.g.dart';

@JsonSerializable()
class ModelNotificationList {
  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'first_page_url')
  final String? firstPageUrl;
  final int? from;
  @JsonKey(name: 'last_page')
  final int? lastPage;
  @JsonKey(name: 'last_page_url')
  final String? lastPageUrl;
  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;
  final String? path;
  @JsonKey(name: 'per_page')
  final int? perPage;
  @JsonKey(name: 'prev_page_url')
  final int? prevPageUrl;
  final int? to;
  final int? total;

  final List<ModelNotification> data;

  factory ModelNotificationList.fromJson(Map<String, dynamic> json) =>
      _$ModelNotificationListFromJson(json);

  ModelNotificationList(
      {required this.currentPage,
      required this.firstPageUrl,
      required this.from,
      required this.lastPage,
      required this.lastPageUrl,
      required this.nextPageUrl,
      required this.path,
      required this.perPage,
      required this.prevPageUrl,
      required this.to,
      required this.total,
      required this.data});

  Map<String, dynamic> toJson() => _$ModelNotificationListToJson(this);
}
