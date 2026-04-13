import 'package:freezed_annotation/freezed_annotation.dart';

part 'best_seller_entity.freezed.dart';

@freezed
class BestSellerEntity with _$BestSellerEntity {
  const factory BestSellerEntity({
    required int id,
    required String title,
    required String description,
    required String image,
    required double price,
    required double rating,
  }) = _BestSellerEntity;
}
