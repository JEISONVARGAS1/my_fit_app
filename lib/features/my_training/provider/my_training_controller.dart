import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:my_fit_app/features/my_training/provider/model/my_training_state.dart';

part 'my_training_controller.g.dart';

@riverpod
class MyTrainingController extends _$MyTrainingController {
  @override
  FutureOr<MyTrainingState> build() {
    ref.onDispose(() {});
    return MyTrainingState.init();
  }

  Future<void> initPage(BuildContext context) async {}

  _setState(MyTrainingState newState) => state = AsyncValue.data(newState);
}
