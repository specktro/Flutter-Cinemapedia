import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/credits_response.dart';

class ActorMapper {
  static Actor castDBToEntity(Cast castDB) {
    return Actor(
      id: castDB.id,
      name: castDB.name,
      profilePath: castDB.profilePath != null
        ? 'https://image.tmdb.org/t/p/w500${castDB.profilePath}'
        : 'https://st3.depositphotos.com/4111759/13425/v/450/depositphotos_134255710-stock-illustration-avatar-vector-male-profile-gray.jpg',
      character: castDB.character
    );
  }
}