import 'package:freezed_annotation/freezed_annotation.dart';

part 'slider_entity.freezed.dart';

@freezed
class SliderEntity with _$SliderEntity {
  const factory SliderEntity({
    required int id,
    required String image,
    required String title,
  }) = _SliderEntity;
}
