import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_fit_app/features/feeding_balance/provider/model/food_model.dart';

part 'feeding_balance_state.freezed.dart';

@freezed
sealed class FeedingBalanceState with _$FeedingBalanceState {
  const factory FeedingBalanceState({
    required double percentage,
    required List<FoodModel> listFood,
  }) = FeedingBalanceStateData;

  factory FeedingBalanceState.init() =>
      FeedingBalanceState(percentage: 10, listFood: [
        FoodModel(
          grams: 30,
          calories: 50,
          label: "Arroz",
        ),
        FoodModel(
          grams: 40,
          calories: 40,
          label: "Frijol",
        ),
        FoodModel(
          grams: 30,
          calories: 140,
          label: "Carne",
        ),
      ]);
}
