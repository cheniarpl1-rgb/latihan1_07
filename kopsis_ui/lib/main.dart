import 'package:flutter/material.dart';
import 'barang_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kopsis UI'),
        ),
        body: ListView(
          children: const [
            BarangCard(
              nama: 'Buku Tulis',
              hargaAnggota: 4000,
              kategori: 'ATK',
              stok: 5,
            ),
          ],
        ),
      ),
    );
  }
}