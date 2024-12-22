import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState({
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) = AuthStateData;

  factory AuthState.init() => AuthState(
    emailController: TextEditingController(),
    passwordController: TextEditingController(),
  );
}
