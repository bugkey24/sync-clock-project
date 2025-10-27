// lib/screens/home_screen.dart

import 'dart:async'; // 1. Import 'dart:async' untuk Timer
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

// 2. Ubah dari StatelessWidget menjadi StatefulWidget
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _timer; // 3. Variabel untuk menampung Timer
  DateTime _currentTime = DateTime.now(); // 4. Variabel untuk state waktu

  @override
  void initState() {
    super.initState();
    // 5. Mulai timer saat widget pertama kali dibuat
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      // 6. Panggil setState setiap 1 detik
      setState(() {
        _currentTime = DateTime.now(); // 7. Perbarui waktu
      });
    });
  }

  @override
  void dispose() {
    // 8. Selalu matikan timer saat widget dihancurkan!
    _timer?.cancel();
    super.dispose();
  }

  // --- Mulai UI Tweaks (Masalah #3) ---

  @override
  Widget build(BuildContext context) {
    final String userName =
        FirebaseAuth.instance.currentUser?.displayName ?? 'User';

    // 9. Gunakan state _currentTime, dan tambahkan DETIK
    final String formattedTime = DateFormat('HH:mm:ss').format(_currentTime);
    final String formattedDate = DateFormat(
      'EEEE, MMMM d',
    ).format(_currentTime);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // 1. Teks Judul (UI Tweak: Dibuat lebih simpel)
              Padding(
                padding: const EdgeInsets.only(top: 32.0, bottom: 24.0),
                child: Text(
                  'Welcome, $userName!',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                ),
              ),

              // 2. Kontainer Jam (UI Tweak: Pakai shadow, bukan warna)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white, // Latar belakang putih
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    // Efek "terangkat" yang modern
                    BoxShadow(
                      color: Colors.blue.shade100.withOpacity(0.3),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      formattedTime, // Sekarang akan update terus
                      style: TextStyle(
                        fontSize: 56, // Sedikit lebih kecil
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(fontSize: 18, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),

              // 3. Spacer (UI Tweak: Mendorong tombol ke tengah)
              const Spacer(),

              // 4. Tombol Clock In (UI Tweak: Hapus teks "You are ready")
              SizedBox(
                width: 180, // Sedikit lebih kecil
                height: 180,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Implementasikan logika Clock In di sini!
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.touch_app, size: 50, color: Colors.white),
                      SizedBox(height: 8),
                      Text(
                        "Clock In",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // 5. Spacer (UI Tweak: Mendorong info ke bawah)
              const Spacer(),

              // 6. Info Bawah (UI Tweak: Dibuat lebih rapi)
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildInfoColumn('Check In', '--:--'),
                    _buildInfoColumn('Check Out', '--:--'),
                    _buildInfoColumn('Working Hrs', '--:--'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper (tidak berubah)
  Widget _buildInfoColumn(String title, String value) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 16, color: Colors.grey[600])),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
