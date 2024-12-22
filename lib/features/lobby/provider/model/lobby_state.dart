import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_fit_app/features/lobby/provider/model/menu_model.dart';

part 'lobby_state.freezed.dart';

@freezed
sealed class LobbyState with _$LobbyState {
  const factory LobbyState({
    required int index,
    required List<MenuModel> icons,
    required PageController controller,
  }) = LobbyStateData;

  factory LobbyState.init() => LobbyState(
        index: 0,
        controller: PageController(),
        icons: [


          MenuModel(selected: Icons.widgets, unSelected: Icons.widgets_outlined),
          MenuModel(selected: Icons.fitness_center, unSelected: Icons.fitness_center),
          MenuModel(selected: Icons.person, unSelected: Icons.perm_identity),
        ],
      );
}
