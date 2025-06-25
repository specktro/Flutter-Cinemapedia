import 'package:flutter/material.dart';

class FavoritesMoviesView extends StatelessWidget {
  const FavoritesMoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Movies'),
      ),
      body: Center(
        child: Text('No favorite movies yet.'),
      ),
    );
  }
}