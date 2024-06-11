import 'package:integra_mobile/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_complaint_list.g.dart';

@JsonSerializable()
class ModelComplaintList {
  @JsonKey(name: 'current_page')
  final int currentPage;
  final String? first_page_url;
  final int? from;
  final int? last_page;
  final String? last_page_url;
  final String? next_page_url;
  final String? path;
  final int? per_page;
  final int? prev_page_url;
  final int? to;
  final int? total;

  final List<ModelComplaint> data;

  factory ModelComplaintList.fromJson(Map<String, dynamic> json) =>
      _$ModelComplaintListFromJson(json);

  ModelComplaintList(
      {required this.currentPage,
      required this.first_page_url,
      required this.from,
      required this.last_page,
      required this.last_page_url,
      required this.next_page_url,
      required this.path,
      required this.per_page,
      required this.prev_page_url,
      required this.to,
      required this.total,
      required this.data});

  Map<String, dynamic> toJson() => _$ModelComplaintListToJson(this);
}
