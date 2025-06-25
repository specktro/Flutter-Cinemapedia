import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavbar({super.key, required this.currentIndex});

  void _onItemTapped(BuildContext context, int index) {
    context.go('/home/$index');
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0.0,
      onTap: (value) => _onItemTapped(context, value),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'Categories'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Favorites'
        )
      ],
    );
  }
}