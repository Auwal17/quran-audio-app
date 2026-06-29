import 'package:go_router/go_router.dart';

/// Application Router Configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) {
        // TODO: Implement Home Screen
        return const Placeholder();
      },
      routes: [
        GoRoute(
          path: 'player/:surahId',
          name: 'player',
          builder: (context, state) {
            // TODO: Implement Player Screen
            return const Placeholder();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) {
        // TODO: Implement About Screen
        return const Placeholder();
      },
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) {
        // TODO: Implement Settings Screen
        return const Placeholder();
      },
    ),
  ],
);
