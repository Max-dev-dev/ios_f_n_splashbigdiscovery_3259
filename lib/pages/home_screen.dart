import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/pages/articles_screen.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/pages/catalog_screen.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/pages/my_fishes_screen.dart';
import 'package:ios_f_n_splashbigdiscovery_3259/pages/quizz_screen.dart';

class HomeScreen extends StatefulWidget {
  final int initialTabIndex;

  const HomeScreen({super.key, this.initialTabIndex = 0});

  @override
  HomeScreenState createState() => HomeScreenState();
}

final GlobalKey<HomeScreenState> homeScreenKey = GlobalKey<HomeScreenState>();

class HomeScreenState extends State<HomeScreen> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialTabIndex;
  }

  final List<Widget> _screens = [
    const CatalogScreen(),
    const MyFishesScreen(),
    const ArticleCatalogScreen(),
    QuizStartScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void navigateToQuizStartTab() {
    setState(() {
      _selectedIndex = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(color: Color(0xFF2D90A8)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: onItemTapped,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            _buildNavItem(FontAwesomeIcons.bookOpen, "Catalog", 0),
            _buildNavItem(FontAwesomeIcons.fish, "My Fishes", 1),
            _buildNavItem(FontAwesomeIcons.newspaper, "Articles", 2),
            _buildNavItem(FontAwesomeIcons.gamepad, "Game", 3),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
    IconData icon,
    String label,
    int index,
  ) {
    bool isSelected = _selectedIndex == index;
    return BottomNavigationBarItem(
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 80,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF1E5B7C) : Colors.transparent,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                FaIcon(icon, color: Colors.white, size: 28),

                const SizedBox(height: 4),
                Text(
                  label,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
      label: '',
    );
  }
}
