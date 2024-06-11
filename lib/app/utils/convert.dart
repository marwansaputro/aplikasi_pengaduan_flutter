Map<String, dynamic> convertingMap(Map<Object?, Object?> data) {
  return data.map((key, value) {
    if (value is Map<Object?, Object?>) {
      return MapEntry(key.toString(), convertingMap(value));
    }

    return MapEntry(key.toString(), value as dynamic);
  });
}
