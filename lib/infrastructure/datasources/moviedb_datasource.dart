import 'package:cinemapedia/config/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/Movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb_response.dart';
import 'package:dio/dio.dart';

class MovieDBDatasource implements MoviesDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Environment.MovieDBKey,
      'language': 'es-MX'
    }
  ));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get('/movie/now_playing');
    final movieDBResponse = MovieDBResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
      .where((movieDB) => movieDB.posterPath != 'no-poster')
      .map((movieDB) => MovieMapper.movieDBToEntity(movieDB)).toList();
    return movies;
  }
}