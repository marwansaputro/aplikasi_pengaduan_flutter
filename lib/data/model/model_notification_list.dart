import 'package:integra_mobile/data/model/abs_return_list.dart';
import 'package:integra_mobile/domain/entities/model_notification.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_notification_list.g.dart';

@JsonSerializable()
class ModelNotificationList extends AbsReturnList {
  final List<ModelNotification> data;

  factory ModelNotificationList.fromJson(Map<String, dynamic> json) =>
      _$ModelNotificationListFromJson(json);

  ModelNotificationList(
      {required super.currentPage,
      required super.firstPageUrl,
      required super.from,
      required super.lastPage,
      required super.lastPageUrl,
      required super.nextPageUrl,
      required super.path,
      required super.perPage,
      required super.prevPageUrl,
      required super.to,
      required super.total,
      required this.data});

  Map<String, dynamic> toJson() => _$ModelNotificationListToJson(this);
}
