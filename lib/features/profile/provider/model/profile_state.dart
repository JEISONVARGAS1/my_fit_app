import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.freezed.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState({
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) = ProfileStateData;

  factory ProfileState.init() => ProfileState(
    emailController: TextEditingController(),
    passwordController: TextEditingController(),
  );
}
