// import 'package:flutter/material.dart';
// import '../profile/complete_profile.dart';
// import 'add_to_cart.dart';
// import 'favorite_screen.dart';
// import 'home_screen.dart';
//
// class MainPage extends StatefulWidget {
//   const MainPage({super.key,
//     required bool showWelcomeSheet});
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   int _selectedIndex = 0;
//
//   final List<Widget> _screens = [
//     const HomeScreen(),
//     const CartScreen(),
//     const FavoriteScreen(),
//     const ProfileScreen(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: AnimatedSwitcher(
//         duration: const Duration(milliseconds: 300),
//         child: _screens[_selectedIndex],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         items: [
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/icons/nav_home.png',
//               width: 30,
//               height: 38,
//               color: _selectedIndex == 0 ? Colors.blue : Colors.black,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/icons/cart.png',
//               width: 30,
//               height: 38,
//               color: _selectedIndex == 1 ? Colors.blue : Colors.black,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/icons/favorite.png',
//               width: 30,
//               height: 38,
//               color: _selectedIndex == 2 ? Colors.blue : Colors.black,
//             ),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Image.asset(
//               'assets/icons/nav_profile.png',
//               width: 30,
//               height: 38,
//               color: _selectedIndex == 3 ? Colors.blue : Colors.black,
//             ),
//             label: '',
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../auth/signup/welcome_to_sunday_mall.dart';
import '../profile/complete_profile.dart';
import 'add_to_cart.dart';
import 'favorite_screen.dart';
import 'home_screen.dart';

class MainPage extends StatefulWidget {
  final bool showWelcomeSheet;

  const MainPage({super.key, this.showWelcomeSheet = false});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    // Delay to make sure bottom sheet is shown after build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.showWelcomeSheet) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
          ),
          builder: (context) => const WelcomeToSundayMall(),
        );
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/nav_home.png',
              width: 30,
              height: 38,
              color: _selectedIndex == 0 ? Colors.blue : Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/cart.png',
              width: 30,
              height: 38,
              color: _selectedIndex == 1 ? Colors.blue : Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/favorite.png',
              width: 30,
              height: 38,
              color: _selectedIndex == 2 ? Colors.blue : Colors.black,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/nav_profile.png',
              width: 30,
              height: 38,
              color: _selectedIndex == 3 ? Colors.blue : Colors.black,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
