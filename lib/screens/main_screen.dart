// lib/screens/main_screen.dart

import 'package:flutter/material.dart';
// Kita akan buat file-file ini di langkah berikutnya
import 'package:sync_clock/screens/home_screen.dart';
import 'package:sync_clock/screens/history_screen.dart';
import 'package:sync_clock/screens/updates_screen.dart';
import 'package:sync_clock/screens/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; // Melacak tab yang sedang aktif

  // Daftar semua halaman utama kita
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    HistoryScreen(),
    UpdatesScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Tampilkan halaman yang sesuai dengan _selectedIndex
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            activeIcon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            activeIcon: Icon(Icons.notifications),
            label: 'Updates',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        // Ini penting agar tema Biru Putih kita berfungsi
        selectedItemColor: Theme.of(context).colorScheme.primary, // Biru
        unselectedItemColor: Colors.grey, // Abu-abu
        showUnselectedLabels: true, // Tampilkan label
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Tipe standar
      ),
    );
  }
}
