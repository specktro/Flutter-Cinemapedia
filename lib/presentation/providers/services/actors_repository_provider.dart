import 'package:cinemapedia/infrastructure/datasources/actorsdb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actors_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// This is a inmutable provider
final actorsRespositoryProvider = Provider((ref) {
  final datasource = ActorsDBDatasource();
  return ActorsRepositoryImpl(datasource);
});