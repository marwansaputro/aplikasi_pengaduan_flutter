import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:integra_mobile/share/network/interceptor/token_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio myDio() {
  final dio = Dio();

  dio.options.baseUrl = dotenv.env['BASE_URL'] ?? '';

  dio.interceptors.add(TokenInterceptor());
  dio.interceptors.add(PrettyDioLogger(requestBody: true, requestHeader: true));

  return dio;
}
