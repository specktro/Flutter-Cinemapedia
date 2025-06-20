import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider = StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>((ref) {
  final actorsRepository = ref.watch(actorsRespositoryProvider);
  return ActorsByMovieNotifier(getActors: actorsRepository.getActorsByMovie);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String movieId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;
  ActorsByMovieNotifier({required this.getActors}): super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) {
      return;
    }

    // FIXME: This delay is just for demonstration purposes.
    await Future.delayed(const Duration(milliseconds: 600));
    print('Realizing http request');
    final actors = await getActors(movieId);
    state = {...state, movieId: actors};
  }
}