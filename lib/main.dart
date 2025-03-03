import 'package:flutter/material.dart';
import 'package:petscan/constants/colors.dart';
import 'package:petscan/pages/greet.dart';
import 'package:petscan/pages/paw.dart';
import 'package:petscan/pages/home.dart';
import 'package:petscan/pages/history.dart';
import 'package:petscan/pages/settings.dart';
import 'package:petscan/pages/articles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetScan',
      debugShowCheckedModeBanner: false,
      home: const Greet(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ArticlesPage(), // Forum Page
    const Paw(), // Placeholder for FAB space (Paw Page)
    const History(),
    const Settings(), // Settings Page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Col.background,
      body: _pages[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        backgroundColor: Col.primary,
        shape: const CircleBorder(),
        onPressed: () {
          _onItemTapped(2);
        },
        child: const Icon(Icons.pets, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8.0,
        color: Col.cardBackground,
        child: Container(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_outlined, 0),
              _buildNavItem(Icons.article_outlined, 1),
              const SizedBox(width: 50),
              _buildNavItem(Icons.location_on_outlined, 3),
              _buildNavItem(Icons.settings_outlined, 4),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    final isSelected = _selectedIndex == index;
    return Container(
      height: 30,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: isSelected ? Col.primary : Colors.transparent,
            width: 3,
          ),
        ),
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: isSelected ? Col.primary : Colors.grey,
        ),
        onPressed: () => _onItemTapped(index),
      ),
    );
  }
}
