import 'package:cinemapedia/presentation/screens/home_screen.dart';
import 'package:cinemapedia/presentation/screens/movie_screen.dart';
import 'package:go_router/go_router.dart';

final approuter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home-screen',
      builder: (context, state) => const HomeScreen()
    ),
    GoRoute(
      path: '/movie/:id',
      name: 'movie-screen',
      builder: (context, state) {
        final movieId = state.pathParameters['id'] ?? 'no_id';
        return MovieScreen(movieId: movieId);
      }
    )
  ]
);