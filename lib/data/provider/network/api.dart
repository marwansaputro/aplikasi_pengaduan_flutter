import 'package:dio/dio.dart';
import 'package:integra_mobile/app/config/app_env.dart';
import 'package:integra_mobile/data/provider/network/interceptor/token_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio myDio() {
  final dio = Dio();

  dio.options.baseUrl = AppEnv().baseUrl();

  dio.interceptors.add(TokenInterceptor());
  dio.interceptors.add(PrettyDioLogger(
      requestBody: true, requestHeader: true, responseBody: true));

  return dio;
}
