import 'package:cinemapedia/domain/entities/Movie.dart';

abstract class MoviesRepository {
  Future<Movie> getNowPlaying({int page = 1});
}