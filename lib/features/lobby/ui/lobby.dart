import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:my_fit_app/features/home/ui/home.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fit_app/features/profile/ui/profile.dart';
import 'package:my_fit_app/features/my_training/ui/my_training.dart';
import 'package:my_fit_app/features/lobby/provider/lobby_controller.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';

class LobbyPage extends ConsumerStatefulWidget {
  const LobbyPage({super.key});

  @override
  ConsumerState<LobbyPage> createState() => _LobbyPage();
}

class _LobbyPage extends ConsumerState<LobbyPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(lobbyControllerProvider).value!;
    final provider = ref.read(lobbyControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: state.controller,
          children: [
            HomePage(),
            MyTrainingPage(),
            ProfilePage(),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        iconPadding: 13,
        color: MyFitUiKit.util.color.menu,
        letIndexChange: provider.changePage,
        animationDuration: Duration(milliseconds: 700),
        buttonBackgroundColor: MyFitUiKit.util.color.primary,
        backgroundColor: MyFitUiKit.util.color.backgroundButton,
        items: List.generate(
          state.icons.length,
          (int index) => CurvedNavigationBarItem(
            child: Icon(
              size: 30,
              provider.chooseIcon(index),
              color: provider.chooseColor(index),
            ),
          ),
        ),
      ),
    );
  }
}
