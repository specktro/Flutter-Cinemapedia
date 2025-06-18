
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/movie_details.dart';
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

  static Movie movieDetailsToEntity(MovieDetails movieDetailsDB) {
    return Movie(
      adult: movieDetailsDB.adult,
      backdropPath: (movieDetailsDB.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieDetailsDB.backdropPath}'
        : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-available.jpg',
      genreIds: movieDetailsDB.genres.map((e) => e.name).toList(),
      id: movieDetailsDB.id,
      originalLanguage: movieDetailsDB.originalLanguage,
      originalTitle: movieDetailsDB.originalTitle,
      overview: movieDetailsDB.overview,
      popularity: movieDetailsDB.popularity,
      posterPath: (movieDetailsDB.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${movieDetailsDB.posterPath}'
        : 'no-poster',
      releaseDate: movieDetailsDB.releaseDate,
      title: movieDetailsDB.title,
      video: movieDetailsDB.video,
      voteAverage: movieDetailsDB.voteAverage,
      voteCount: movieDetailsDB.voteCount
    );
  }
}