import 'package:cinemapedia/presentation/views/favorites_movies_view.dart';
import 'package:cinemapedia/presentation/views/home_view.dart';
import 'package:cinemapedia/presentation/widgets/shared/custom_bottom_navbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  final List<Widget> viewRoutes = const [
    HomeView(),
    SizedBox(),
    FavoritesMoviesView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavbar(currentIndex: pageIndex),
    );
  }
}