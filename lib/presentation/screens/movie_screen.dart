import 'package:cinemapedia/presentation/providers/movie_info_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

class MovieScreen extends ConsumerStatefulWidget {
  final String movieId;
  
  const MovieScreen({
    super.key,
    required this.movieId
  });

  @override
  MovieScreenState createState() => MovieScreenState();
}

class MovieScreenState extends ConsumerState<MovieScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(movieDetailProvider.notifier).loadMovie(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    final Movie? movie = ref.watch(movieDetailProvider)[widget.movieId];

    if (movie == null) {
      return Scaffold(body: const Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie ID: ${widget.movieId}'),
      ),
      body: const Placeholder()
    );
  }
}