import 'package:flutter/material.dart';

class CahayaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cahaya'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Ini adalah halaman Cahaya',
              style: TextStyle(fontSize: 24),
            ),
            // Tambahkan widget atau logika khusus untuk halaman Lampu 2 di sini
          ],
        ),
      ),
    );
  }
}

