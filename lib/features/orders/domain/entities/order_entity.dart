import 'package:freezed_annotation/freezed_annotation.dart';

part 'order_entity.freezed.dart';

@freezed
class OrderEntity with _$OrderEntity {
  const factory OrderEntity({
    required int id,
    required String hotelName,
    required String roomType,
    required DateTime checkIn,
    required DateTime checkOut,
    required double totalPrice,
    required String status,
  }) = _OrderEntity;
}
