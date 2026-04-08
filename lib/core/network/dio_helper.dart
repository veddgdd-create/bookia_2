import 'package:dio/dio.dart';
import '../../../core/services/dio/dio_provider.dart';

class DioHelper {
  DioHelper._();

  static Dio get dio => DioProvider.dio;

  static Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    return dio.get(
      endPoint,
      queryParameters: query,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
          'locale-identifier': lang,
        },
      ),
    );
  }

  static Future<Response> postData({
    required String endPoint,
    required dynamic data,
    String lang = 'en',
    String? token,
  }) async {
    return dio.post(
      endPoint,
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
          'locale-identifier': lang,
        },
      ),
    );
  }

  // Add put, delete, patch as needed
}
