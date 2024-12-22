import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_fit_app/core/page_not_found.dart';
import 'package:my_fit_app/features/auth/ui/auth.dart';
import 'package:my_fit_app/features/home/ui/home.dart';
import 'package:my_fit_app/features/lobby/ui/lobby.dart';

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
