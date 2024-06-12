import 'package:flutter/material.dart';
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

extension StatusPengaduanExt on StatusPengaduan {
  Color get color {
    switch (this) {
      case StatusPengaduan.success:
        return Colors.green;
      case StatusPengaduan.reject:
        return Colors.red;
      default:
        return Colors.blue;
    }
  }
}
