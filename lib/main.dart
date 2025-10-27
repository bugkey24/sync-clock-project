// lib/main.dart

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:sync_clock/screens/login_screen.dart';
// Nanti kita akan arahkan ke 'auth_gate' atau 'wrapper'
// tapi untuk sekarang LoginScreen sudah cukup.

// ======================================================
// TEMA BIRU PUTIH BARU KITA
// ======================================================
final Color kPrimaryColor = Colors.blue.shade800; // Biru tua sebagai utama
final Color kBackgroundColor = Colors.white; // Latar belakang putih bersih
final Color kAccentColor = Colors.blue.shade100; // Biru muda untuk aksen
// ======================================================

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const SyncClockApp());
}

class SyncClockApp extends StatelessWidget {
  const SyncClockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SyncClock',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        // Terapkan warna global baru
        scaffoldBackgroundColor: kBackgroundColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
          background: kBackgroundColor,
          primary: kPrimaryColor,
        ),

        // Terapkan gaya tombol global baru
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor, // Tombol biru
            foregroundColor: Colors.white, // Teks tombol putih
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Terapkan gaya text field global
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            // Border saat tidak di-klik
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            // Border saat di-klik
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: kPrimaryColor, width: 2.0),
          ),
          filled: true,
          fillColor: Colors.white, // Latar belakang text field putih
          labelStyle: TextStyle(color: Colors.grey[700]),
        ),

        // Terapkan gaya app bar global
        appBarTheme: AppBarTheme(
          backgroundColor: kBackgroundColor, // App bar putih
          elevation: 0,
          foregroundColor: Colors.black, // Teks/ikon hitam
          centerTitle: true,
          titleTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      home: const LoginScreen(), // Kita masih mulai dari LoginScreen
    );
  }
}
