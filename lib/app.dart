// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:flutter/material.dart';
import 'package:my_fit_app/router.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fit_ui_kit/my_fit_ui_kit.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_fit_app/core/initializer/onstart_widget.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    GoRouter routes = ref.watch(goRouterProvider);
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return AppErrorWidget(error: details);
    };
    FlutterNativeSplash.remove();
    return Builder(
      builder: (context) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: MyFitUiKit.util.appThere.getThemeData(),
          routerConfig: routes,
          builder: (context, child) => Initializer(
            onReady: child!,
            onLoading: const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            ),
          ),
        );
      },
    );
  }
}

/// This is an example of a more user friendly error widget
/// By default Flutter will show a red screen with the error in debug mode
/// and a grey screen in release mode
class AppErrorWidget extends StatelessWidget {
  final FlutterErrorDetails? error;

  const AppErrorWidget({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.orangeAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Oups!',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Sorry, Something went wrong',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 8),
          Text(
            '${error?.exception}\n',
            style: const TextStyle(color: Colors.white, fontSize: 10),
          ),
        ],
      ),
    );
  }
}
