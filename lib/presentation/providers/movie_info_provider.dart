import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieDetailProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final moviesRepository = ref.watch(movieRespositoryProvider);
  return MovieMapNotifier(getMovie: moviesRepository.getMovieById);
});

typedef GetMovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMovieCallback getMovie;
  MovieMapNotifier({required this.getMovie}): super({});

  Future<void> loadMovie(String movieId) async {
    if (state[movieId] != null) {
      return;
    }

    // This delay is intentional to mimic real-world conditions.
    await Future.delayed(const Duration(milliseconds: 400));
    final movie = await getMovie(movieId);
    state = {...state, movieId: movie};
  }
}