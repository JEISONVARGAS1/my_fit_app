import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState({
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) = HomeStateData;

  factory HomeState.init() => HomeState(
    emailController: TextEditingController(),
    passwordController: TextEditingController(),
  );
}
