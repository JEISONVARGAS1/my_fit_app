import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fit_app/core/page_not_found.dart';
import 'package:my_fit_app/features/auth/ui/auth.dart';
import 'package:my_fit_app/features/exercise_detail/ui/exercise_detail.dart';
import 'package:my_fit_app/features/feeding_balance/ui/feeding_balance.dart';
import 'package:my_fit_app/features/home/ui/home.dart';
import 'package:my_fit_app/features/lobby/ui/lobby.dart';
import 'package:my_fit_app/features/smart_watch/ui/smart_watch.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    String initialLocation = '/auth';

    return GoRouter(
      initialLocation: initialLocation,
      errorBuilder: (context, state) => PageNotFound(state: state),
      routes: [
        GoRoute(
          name: 'home',
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          name: 'auth',
          path: '/auth',
          builder: (context, state) => const AuthPage(),
        ),
        GoRoute(
          name: 'lobby',
          path: '/lobby',
          builder: (context, state) => const LobbyPage(),
        ),
        GoRoute(
          name: 'exerciseDetailPage',
          path: '/exerciseDetailPage',
          builder: (context, state) => const ExerciseDetailPage(),
        ),
        GoRoute(
          name: 'feedingBalancePage',
          path: '/feedingBalancePage',
          builder: (context, state) => const FeedingBalancePage(),
        ),
        GoRoute(
          name: 'smartWatchPage',
          path: '/smartWatchPage',
          builder: (context, state) =>  SmartWatchPage(),
        ),
        GoRoute(
          name: '404',
          path: '/404',
          builder: (context, state) => PageNotFound(
            state: state,
          ),
        ),
      ],
    );
  },
);

Page<dynamic> buildPageWithTransition(Widget child) {
  return CustomTransitionPage(
    transitionDuration: const Duration(milliseconds: 1000),
    key: ValueKey(child.hashCode),
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
