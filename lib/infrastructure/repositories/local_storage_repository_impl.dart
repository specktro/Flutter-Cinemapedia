import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDataSource localStorageDataSource;

  LocalStorageRepositoryImpl(this.localStorageDataSource);

  @override
  Future<void> toggleFavorite(Movie movie) {
    return localStorageDataSource.toggleFavorite(movie);
  }

  @override
  Future<bool> isMovieFavorite(int movieID) {
    return localStorageDataSource.isMovieFavorite(movieID);
  }

  @override
  Future<List<Movie>> getFavoriteMovies({int limit = 10, int offset = 0}) {
    return localStorageDataSource.getFavoriteMovies(limit: limit, offset: offset);
  }
}