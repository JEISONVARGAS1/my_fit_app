import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_training_state.freezed.dart';

@freezed
sealed class MyTrainingState with _$MyTrainingState {
  const factory MyTrainingState({
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) = MyTrainingStateData;

  factory MyTrainingState.init() => MyTrainingState(
    emailController: TextEditingController(),
    passwordController: TextEditingController(),
  );
}
