import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio myDio() {
  final dio = Dio();

  dio.options.baseUrl = dotenv.env['BASE_URL'] ?? '';

  dio.interceptors.add(PrettyDioLogger());

  return dio;
}
