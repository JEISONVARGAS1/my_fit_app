import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:my_fit_app/features/home/provider/model/home_state.dart';

part 'home_controller.g.dart';

@riverpod
class HomeController extends _$HomeController {
  @override
  FutureOr<HomeState> build() {
    ref.onDispose(() {});
    return HomeState.init();
  }

  Future<void> initPage(BuildContext context) async {}

  _setState(HomeState newState) => state = AsyncValue.data(newState);
}
