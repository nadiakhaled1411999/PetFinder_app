import 'package:flutter/material.dart';
import 'package:petfinder_app/features/home/presentation/view/home_screen.dart';
import 'package:petfinder_app/features/home/presentation/view/favorites_screen.dart';
import 'package:petfinder_app/features/home/presentation/widgets/bottom_nav_bar.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;

  final screens = [
    HomeScreen(),
    FavoritesScreen(),
    Placeholder(),
    Placeholder(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
