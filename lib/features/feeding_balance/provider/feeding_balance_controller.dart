import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:my_fit_app/features/feeding_balance/provider/model/feeding_balance_state.dart';

part 'feeding_balance_controller.g.dart';

@riverpod
class FeedingBalanceController extends _$FeedingBalanceController {
  @override
  FutureOr<FeedingBalanceState> build() {
    ref.onDispose(() {});
    return FeedingBalanceState.init();
  }

  Future<void> initPage(BuildContext context) async {}

  _setState(FeedingBalanceState newState) => state = AsyncValue.data(newState);
}
