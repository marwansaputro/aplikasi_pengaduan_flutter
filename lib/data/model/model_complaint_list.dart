import 'package:integra_mobile/data/model/abs_return_list.dart';
import 'package:integra_mobile/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_complaint_list.g.dart';

@JsonSerializable()
class ModelComplaintList extends AbsReturnList {
  final List<ModelComplaint> data;

  factory ModelComplaintList.fromJson(Map<String, dynamic> json) =>
      _$ModelComplaintListFromJson(json);

  ModelComplaintList(
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

  Map<String, dynamic> toJson() => _$ModelComplaintListToJson(this);
}
