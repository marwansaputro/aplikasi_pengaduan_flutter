import 'package:json_annotation/json_annotation.dart';

enum StatusPengaduan {
  @JsonValue('incoming')
  incoming,
  @JsonValue('process')
  process,
  @JsonValue('reject')
  reject,
  @JsonValue('success')
  success,
}
