import 'package:cinemapedia/domain/entities/Movie.dart';

abstract class MoviesDatasource {
  Future<Movie> getNowPlaying({int page = 1});
}