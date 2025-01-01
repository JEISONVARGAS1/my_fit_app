import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:my_fit_app/features/lobby/provider/model/lobby_state.dart';

part 'lobby_controller.g.dart';

@riverpod
class LobbyController extends _$LobbyController {
  @override
  FutureOr<LobbyState> build() {
    ref.onDispose(() {});
    return LobbyState.init();
  }

  bool changePage(int index){
    state.value!.controller.jumpToPage(index);
    _setState(state.value!.copyWith(index: index));
    return true;
  }

  Color chooseColor(index) {
    if(index == state.value!.index) return MyFitUiKit.util.color.menu;
    return MyFitUiKit.util.color.textColor;
  }

  Future<void> initPage(BuildContext context) async {}

  IconData chooseIcon(int index) {
    if(index == state.value!.index) return state.value!.icons[index].selected;
    return state.value!.icons[index].unSelected;
  }

  _setState(LobbyState newState) => state = AsyncValue.data(newState);
}
