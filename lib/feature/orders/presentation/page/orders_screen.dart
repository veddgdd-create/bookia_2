import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/components/buttons/main_button.dart';
import 'package:bookia/feature/orders/presentation/cubit/orders_cubit.dart';
import 'package:bookia/feature/orders/presentation/cubit/orders_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrdersCubit()..getOrders(),
      child: Scaffold(
        appBar: AppBar(title: const Text('My Orders')),
        body: BlocBuilder<OrdersCubit, OrdersState>(
          builder: (context, state) {
            var cubit = context.read<OrdersCubit>();
            if (state is OrdersLoadingState) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is OrdersErrorState || cubit.orders.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.receipt_long,
                      size: 64,
                      color: AppColors.greyColor,
                    ),
                    Gap(16),
                    Text('No orders yet', style: TextStyles.styleSize18()),
                    Gap(8),
                    MainButton(
                      text: 'Retry',
                      onPressed: () => cubit.getOrders(),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cubit.orders.length,
              itemBuilder: (context, index) {
                var order = cubit.orders[index];
                return Card(
                  child: ListTile(
                    title: Text('Order #\${order.id}'),
                    subtitle: Text(order.date ?? ''),
                    trailing: Text(
                      '\$${order.total}',
                      style: TextStyles.styleSize18(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
