import 'package:dio/dio.dart';
import 'package:integra_mobile/app/services/helper_storage.dart';

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({
      "Authorization": "Bearer ${SharedPreferenceHelper.instance.token}",
    });

    super.onRequest(options, handler);
  }
}
