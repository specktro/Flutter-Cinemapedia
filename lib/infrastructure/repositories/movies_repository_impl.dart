import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesDatasource datasource;

  MoviesRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    return datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    return datasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    return datasource.getUpcoming(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    return datasource.getTopRated(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) async {
    return datasource.getMovieById(id);
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    return datasource.searchMovies(query);
  }
}