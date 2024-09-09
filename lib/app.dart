import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skill_snap/constants/theme_colors.dart';
import 'package:skill_snap/views/home_screen.dart';
import 'package:skill_snap/views/inbox_screen.dart';
import 'package:skill_snap/views/profile_screen.dart';
import 'package:skill_snap/views/search_screen.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  var _currentIndex = 0;
  get _screens => <Widget>[
        const HomeScreen(),
        const SearchScreen(),
        const InboxScreen(),
        const ProfileScreen()
      ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skill snap',
      themeMode: ThemeMode.dark,
      theme: getLightTheme(),
      darkTheme: getDarkTheme(),
      home: home(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: false,
    );
  }

  ThemeData getDarkTheme() {
    return ThemeData(
        useMaterial3: false,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        scaffoldBackgroundColor: ThemeColors.background,
        canvasColor: ThemeColors.background,
        cardColor: ThemeColors.card,
        iconTheme: const IconThemeData(color: Colors.white),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.grey,
            ),
        actionIconTheme: const ActionIconThemeData(), // back, menu etc.
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: ThemeColors.card,
                foregroundColor: ThemeColors.textSecondary)));
  }

  Scaffold home() {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: ThemeColors.primaryColor,
        unselectedItemColor: ThemeColors.textSecondary,
        selectedFontSize: 0,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(
                "assets/home.svg",
                height: 20,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/home_active.svg",
              height: 20,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(
                "assets/search.svg",
                height: 20,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/search_active.svg",
              height: 20,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(
                "assets/inbox.svg",
                height: 20,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/inbox_active.svg",
              height: 20,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(
                "assets/profile.svg",
                height: 20,
              ),
            ),
            activeIcon: SvgPicture.asset(
              "assets/profile_active.svg",
              height: 20,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
