import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:my_fit_app/features/profile/provider/model/profile_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<ProfileState> build() {
    ref.onDispose(() {});
    return ProfileState.init();
  }

  Future<void> initPage(BuildContext context) async {}

  _setState(ProfileState newState) => state = AsyncValue.data(newState);
}
