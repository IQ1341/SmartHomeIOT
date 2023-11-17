import 'package:flutter/material.dart';

class SuhuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suhu'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ini adalah halaman Suhu',
              style: TextStyle(fontSize: 24),
            ),
            // Tambahkan widget atau logika khusus untuk halaman Lampu 2 di sini
          ],
        ),
      ),
    );
  }
}
