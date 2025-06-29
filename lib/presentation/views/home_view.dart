import 'package:cinemapedia/presentation/providers/first_load_provider.dart';
import 'package:cinemapedia/presentation/providers/movies_providers.dart';
import 'package:cinemapedia/presentation/providers/movies_slideshow_provider.dart';
import 'package:cinemapedia/presentation/screens/full_screen_loader.dart';
import 'package:cinemapedia/presentation/widgets/movies_horizontal_listview.dart';
import 'package:cinemapedia/presentation/widgets/movies_sildeshow.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(firstLoadProvider);
    
    if (isLoading) {
      return const FullScreenLoader();
    }

    final slideshowMovies = ref.watch(moviesSlideshoProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          flexibleSpace: const FlexibleSpaceBar(
            title: CustomAppBar()
          )
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                MoviesSlideWidget(movies: slideshowMovies),
                MoviesHorizontalListView(
                  movies: nowPlayingMovies,
                  title: 'Now in Theatres',
                  subtitle: 'Today',
                  loadNextPage: () {
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                  }
                ),
                MoviesHorizontalListView(
                  movies: upcomingMovies,
                  title: 'Upcoming Movies',
                  subtitle: 'Next month',
                  loadNextPage: () {
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
                  }
                ),
                MoviesHorizontalListView(
                  movies: popularMovies,
                  title: 'Popular Movies',
                  subtitle: 'Today',
                  loadNextPage: () {
                    ref.read(popularMoviesProvider.notifier).loadNextPage();
                  }
                ),
                MoviesHorizontalListView(
                  movies: topRatedMovies,
                  title: 'Top Rated Movies',
                  subtitle: 'All time',
                  loadNextPage: () {
                    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
                  }
                ),
                const SizedBox(height: 10)
              ]
            );
          },
          childCount: 1)
        )
      ]
    );
  }
}