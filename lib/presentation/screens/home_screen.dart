import 'package:cinemapedia/presentation/providers/movies_providers.dart';
import 'package:cinemapedia/presentation/providers/movies_slideshow_provider.dart';
import 'package:cinemapedia/presentation/widgets/movies_horizontal_listview.dart';
import 'package:cinemapedia/presentation/widgets/movies_sildeshow.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_appbar.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavbar(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final slideshowMovies = ref.watch(moviesSlideshoProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    return Column(
      children: [
        CustomAppBar(),
        MoviesSlideWidget(movies: slideshowMovies),
        MoviesHorizontalListView(
          movies: nowPlayingMovies,
          title: 'Now in Theatres',
          subtitle: 'Today',
        )
      ]
    );
  }
}