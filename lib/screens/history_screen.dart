import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance History')),
      body: const Center(
        child: Text('History Screen - Nanti kita isi (Unit 2)'),
      ),
    );
  }
}
