import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int currentIndex;

  final void Function(int index)? onpress;

  const CustomBottomNavigation(
      {super.key, required this.currentIndex, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onpress,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Movie'),
          BottomNavigationBarItem(
              icon: Icon(Icons.label_outline), label: 'Post'),
          BottomNavigationBarItem(
              icon: Icon(Icons.numbers), label: 'Number'),
        ]);
  }
}
