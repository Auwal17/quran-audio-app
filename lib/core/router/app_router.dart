import 'package:go_router/go_router.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/player/screens/player_screen.dart';
import '../../features/about/screens/about_screen.dart';
import '../../features/settings/screens/settings_screen.dart';

/// Application Router Configuration
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'player/:surahId',
          name: 'player',
          builder: (context, state) {
            final surahId = state.pathParameters['surahId'] ?? '1';
            return PlayerScreen(surahId: surahId);
          },
        ),
      ],
    ),
    GoRoute(
      path: '/about',
      name: 'about',
      builder: (context, state) => const AboutScreen(),
    ),
    GoRoute(
      path: '/settings',
      name: 'settings',
      builder: (context, state) => const SettingsScreen(),
    ),
  ],
);
