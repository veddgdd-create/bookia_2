import 'package:bookia/feature/orders/data/models/order.dart';
import 'package:bookia/feature/orders/data/repo/orders_repo.dart';
import 'package:bookia/feature/orders/presentation/cubit/orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitialState());

  List<Order> orders = [];

  Future<void> getOrders() async {
    emit(OrdersLoadingState());
    var res = await OrdersRepo.getOrders();
    if (res != null) {
      orders = res;
      emit(OrdersSuccessState());
    } else {
      emit(OrdersErrorState());
    }
  }
}
