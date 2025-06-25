import 'package:cinemapedia/presentation/screens/home_screen.dart';
import 'package:cinemapedia/presentation/screens/movie_screen.dart';
import 'package:go_router/go_router.dart';

final approuter = GoRouter(
  initialLocation: '/home/0',
  routes: [
    GoRoute(
      path: '/home/:page',
      name: 'home-screen',
      builder: (context, state) {
        final pageIndex = int.tryParse(state.pathParameters['page'] ?? '0') ?? 0;
        return HomeScreen(pageIndex: pageIndex);
      },
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: 'movie-screen',
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no_id';
            return MovieScreen(movieId: movieId);
          }
        )
      ]
    ),
    GoRoute(
      path: '/',
      redirect: (_, _) => '/home/0' 
    )
  ]
);