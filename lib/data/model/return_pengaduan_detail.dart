import 'package:integra_mobile/domain/entities/entities.dart';
import 'package:json_annotation/json_annotation.dart';

part 'return_pengaduan_detail.g.dart';

@JsonSerializable()
class ReturnPengaduanDetail {
  final ModelComplaint data;

  ReturnPengaduanDetail({required this.data});

  factory ReturnPengaduanDetail.fromJson(Map<String, dynamic> json) =>
      _$ReturnPengaduanDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ReturnPengaduanDetailToJson(this);
}
