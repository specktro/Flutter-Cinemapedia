import 'package:path_provider/path_provider.dart' show getApplicationDocumentsDirectory;
import 'package:cinemapedia/domain/datasources/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:isar/isar.dart';

class IsarDatasource implements LocalStorageDataSource {
  late Future<Isar> db;

  IsarDatasource() {
    db = openIsar();
  }

  Future<Isar> openIsar() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open(
          [MovieSchema],
          inspector: true,
          directory: dir.path
      );
    }

    return Future.value(Isar.getInstance());
  }

  @override
  Future<bool> isMovieFavorite(int movieID) async {
    final isar = await db;
    final Movie? movie = await isar.movies
      .filter()
      .idEqualTo(movieID)
      .findFirst();
    return movie != null;
  }

  @override
  Future<void> toggleFavorite(Movie movie) async {
    final isar = await db;

    final favoriteMovie = await isar.movies
        .filter()
        .idEqualTo(movie.id)
        .findFirst();

    if ( favoriteMovie != null ) {
      isar.writeTxnSync(() => isar.movies.deleteSync(favoriteMovie.movieId!));
      return;
    }

    isar.writeTxnSync(() => isar.movies.putSync(movie));
  }

  @override
  Future<List<Movie>> getFavoriteMovies({int limit = 10, int offset = 0}) async {
    final isar = await db;
    final movies = await isar.movies
      .where()
      .offset(offset)
      .limit(limit)
      .findAll();
    return movies;
  }
}