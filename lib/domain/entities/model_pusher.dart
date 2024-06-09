//  {title: Hello, body: Hello, world!, data: {pusher: {"instanceId":"2883a73c-97de-4ae4-b99a-fde7fe6abcc8","publishId":"pubid-58e92628-239b-4282-a929-0e23ad290b6e","hasData":true,"hasDisplayableContent":true}, put: whatever, you: need, here: ✨}}
import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'model_pusher.g.dart';

@JsonSerializable()
class ModelPusher {
  final String title;
  final String body;
  // final DataModelPusher data;

  ModelPusher({required this.title, required this.body});

  factory ModelPusher.fromJson(Map<String, dynamic> json) =>
      _$ModelPusherFromJson(json);

  Map<String, dynamic> toJson() => _$ModelPusherToJson(this);
}

@JsonSerializable()
class DataModelPusher {
  @ModelInsiderDataPusherConverter()
  final ModelInsideDataPusher pusher;

  DataModelPusher({required this.pusher});

  factory DataModelPusher.fromJson(Map<String, dynamic> json) =>
      _$DataModelPusherFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelPusherToJson(this);
}

@JsonSerializable()
class ModelInsideDataPusher {
  final String instanceId;
  final String publishId;
  final bool? hasData;
  final bool? hasDisplayableContent;

  ModelInsideDataPusher({
    required this.instanceId,
    required this.publishId,
    this.hasData,
    this.hasDisplayableContent,
  });

  factory ModelInsideDataPusher.fromJson(Map<String, dynamic> json) =>
      _$ModelInsideDataPusherFromJson(json);

  Map<String, dynamic> toJson() => _$ModelInsideDataPusherToJson(this);
}

class ModelInsiderDataPusherConverter
    implements JsonConverter<ModelInsideDataPusher, String> {
  const ModelInsiderDataPusherConverter();

  @override
  ModelInsideDataPusher fromJson(String json) {
    return ModelInsideDataPusher.fromJson(jsonDecode(json));
  }

  @override
  String toJson(ModelInsideDataPusher object) {
    return object.toJson().toString();
  }
}
