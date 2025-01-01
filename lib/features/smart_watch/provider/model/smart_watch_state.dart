import 'package:health/health.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'smart_watch_state.freezed.dart';

@freezed
sealed class SmartWatchState with _$SmartWatchState {
  const factory SmartWatchState({
    required double percentage,
    required List<HealthDataType> types,
  }) = SmartWatchStateData;

  factory SmartWatchState.init() => SmartWatchState(
        percentage: 10,
        types: [
          HealthDataType.STEPS,
          HealthDataType.DISTANCE_WALKING_RUNNING,
        ],
      );
}
