
import 'package:cinemapedia/domain/entities/Movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb.dart';

class MovieMapper {
  static Movie movieDBToEntity(MovieDB movieDB) {
    return Movie(
      adult: movieDB.adult,
      backdropPath: (movieDB.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieDB.backdropPath}'
        : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-available.jpg',
      genreIds: movieDB.genreIds.map((e) => e.toString()).toList(),
      id: movieDB.id,
      originalLanguage: movieDB.originalLanguage,
      originalTitle: movieDB.originalTitle,
      overview: movieDB.overview,
      popularity: movieDB.popularity,
      posterPath: (movieDB.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieDB.posterPath}'
        : 'no-poster',
      releaseDate: movieDB.releaseDate,
      title: movieDB.title,
      video: movieDB.video,
      voteAverage: movieDB.voteAverage,
      voteCount: movieDB.voteCount
    );
  }
}