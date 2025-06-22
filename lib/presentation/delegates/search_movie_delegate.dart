import 'dart:async';
import 'package:flutter/material.dart';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';


typedef SearchMoviescallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviescallback onSearch;
  StreamController debounceMovie = StreamController<List<Movie>>.broadcast();
  Timer? _debounceTimer;

  SearchMovieDelegate({required this.onSearch});

  void _clearStream() {
    debounceMovie.close();
  }

  void _onQueryChanged(String query) {
    if (_debounceTimer?.isActive ?? false) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        debounceMovie.add([]);
        return;
      }

      final movies = await onSearch(query);
      print(movies.length.toString());
      debounceMovie.add(movies);
    });
  }

  @override
  String get searchFieldLabel => 'Search movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        child: IconButton(onPressed: () => query = '', icon: Icon(Icons.clear)),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        _clearStream();
        close(context, null);
      },
      icon: Icon(Icons.arrow_back_ios_new_rounded),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);

    return StreamBuilder(
      stream: debounceMovie.stream,
      builder: (context, snapshot) {
        final movies = snapshot.data ?? [];

        return ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            return _MovieItem(
              onMovieSelected: (context, movie) {
                _clearStream();
                close(context, movie);
              },
              movie: movies[index]
            );
          },
        );
      },
    );
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;

  const _MovieItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Row(
          children: [
            SizedBox(
              width:  size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(movie.posterPath, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 10.0),
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: textStyles.titleMedium),
                  (movie.overview.length > 100)
                  ? Text('${movie.overview.substring(0,100)}...')
                  : Text(movie.overview),
                  Row(
                    children: [
                      Icon(Icons.star_half_rounded, color: Colors.yellow[800]),
                      const SizedBox(width: 5.0),
                      Text(movie.voteAverage.toStringAsFixed(1), style: textStyles.bodyMedium!.copyWith(
                        color: Colors.yellow[800]
                      )),
                    ],
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}