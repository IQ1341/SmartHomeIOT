import 'package:flutter/material.dart';

class KelembabanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kelembaban'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ini adalah halaman Kelembaban',
              style: TextStyle(fontSize: 24),
            ),
            // Tambahkan widget atau logika khusus untuk halaman Lampu 2 di sini
          ],
        ),
      ),
    );
  }
}
