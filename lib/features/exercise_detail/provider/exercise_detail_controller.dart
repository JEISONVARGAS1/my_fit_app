import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:my_fit_app/features/exercise_detail/provider/model/exercise_detail_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:my_fit_app/features/home/provider/model/home_state.dart';

part 'exercise_detail_controller.g.dart';

@riverpod
class ExerciseDetailController extends _$ExerciseDetailController {
  @override
  FutureOr<ExerciseDetailState> build() {
    ref.onDispose(() {});
    return ExerciseDetailState.init();
  }

  Future<void> initPage(BuildContext context) async {}

  _setState(ExerciseDetailState newState) => state = AsyncValue.data(newState);
}
