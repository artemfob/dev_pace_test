import 'package:dev_pace_test/screens/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class Route {
  String name;
  String path;
  Widget screen;

  Route({
    required this.name,
    required this.path,
    required this.screen,
  });
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 10),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(
      opacity: animation,
      child: child,
    ),
  );
}

// FadeTransition(opacity: animation, child: child)
List<Route> routes = [
  Route(name: 'home', path: '/', screen: const HomeScreen()),
];

final router = GoRouter(
    initialLocation: '/',
    routes: routes
        .map((e) => GoRoute(
            path: e.path,
            name: e.name,
            pageBuilder: (context, state) => buildPageWithDefaultTransition(
                context: context, state: state, child: e.screen)))
        .toList());
