import 'package:cinemapedia/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final approuter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home-screen',
      builder: (context, state) => const HomeScreen()
    )
  ]
);