import 'package:cinemapedia/config/environment.dart';
import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/mappers/actor_mapper.dart';
import 'package:cinemapedia/infrastructure/models/credits_response.dart';
import 'package:dio/dio.dart';

class ActorsDBDatasource implements ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDBKey,
        'language': 'es-MX'
      }
  ));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    final creditsDBResponse = CreditsResponse.fromJson(response.data);
    return creditsDBResponse
        .cast.map((castDB) => ActorMapper.castDBToEntity(castDB)).toList();
  }
}