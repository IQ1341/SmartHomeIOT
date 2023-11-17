import 'package:flutter/material.dart';

class Lampu1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lampu 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ini adalah halaman Lampu 1',
              style: TextStyle(fontSize: 24),
            ),
            // Tambahkan widget atau logika khusus untuk halaman Lampu 2 di sini
          ],
        ),
      ),
    );
  }
}
