import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exercise_detail_state.freezed.dart';

@freezed
sealed class ExerciseDetailState with _$ExerciseDetailState {
  const factory ExerciseDetailState({
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) = ExerciseDetailStateData;

  factory ExerciseDetailState.init() => ExerciseDetailState(
    emailController: TextEditingController(),
    passwordController: TextEditingController(),
  );
}
