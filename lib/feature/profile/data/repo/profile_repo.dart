import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/feature/auth/data/models/auth_response/data.dart';
import 'package:bookia/core/services/dio/api_endpoints.dart'; // Assume add profile endpoints

class ProfileRepo {
  static Future<UserModel?> getProfile() async {
    try {
      var user = SharedPref.getUserData();
      var token = user?.token ?? '';
      var headers = {'Authorization': 'Bearer $token'};
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.profile,
        headers: headers,
      );
      if (res != null) {
        var body = res.data;
        return UserModel.fromJson(body);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<UserModel?> updateProfile({
    required String name,
    required String email,
    required String phone,
    String? address,
  }) async {
    try {
      var user = SharedPref.getUserData();
      var token = user?.token ?? '';
      var headers = {'Authorization': 'Bearer $token'};
      var body = {
        'name': name,
        'email': email,
        'phone': phone,
        'address': address ?? '',
      };
      var res = await DioProvider.post(
        endpoint: ApiEndpoints.updateProfile,
        data: body,
        headers: headers,
      );
      if (res != null) {
        var body = res.data;
        return UserModel.fromJson(body);
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
