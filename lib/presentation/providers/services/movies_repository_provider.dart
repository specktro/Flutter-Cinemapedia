import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movies_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// This is a inmutable provider
final movieRespositoryProvider = Provider((ref) {
  final datasource = MovieDBDatasource();
  return MoviesRepositoryImpl(datasource);
});