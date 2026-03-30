import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/feature/orders/data/models/order.dart';
import 'package:bookia/core/services/dio/api_endpoints.dart';

class OrdersRepo {
  static Future<List<Order>?> getOrders() async {
    try {
      var user = SharedPref.getUserData();
      var token = user?.token ?? '';
      var headers = {'Authorization': 'Bearer $token'};
      var res = await DioProvider.get(
        endpoint: ApiEndpoints.orders,
        headers: headers,
      );
      if (res != null) {
        var body = res.data as List;
        return body.map((e) => Order.fromJson(e)).toList();
      }
    } catch (e) {
      return null;
    }
    return null;
  }
}
