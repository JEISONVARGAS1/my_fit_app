import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:my_fit_app/features/auth/provider/model/auth_state.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr<AuthState> build() {
    ref.onDispose(() {});
    return AuthState.init();
  }

  Future<void> initPage(BuildContext context) async {}

  Future<void> setData() async {
  }

  _setState(AuthState newState) => state = AsyncValue.data(newState);
}
