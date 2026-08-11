import 'package:flutter/material.dart';

// Class Barang dengan Enkapsulasi
class Barang {
  String nama;
  double harga;
  
  // 1. Variabel privat (pake tanda _ )
  int _stok;

  // Konstruktor
  Barang({
    required this.nama,
    required this.harga,
    required int stok,
  }) : _stok = stok;

  // 2. Getter untuk membaca nilai _stok dari luar
  int get stok => _stok;

  // 3. Method jual(int n) untuk mengurangi stok HANYA jika mencukupi
  bool jual(int n) {
    if (n <= _stok) {
      _stok -= n;
      return true; // Penjualan berhasil
    } else {
      return false; // Stok tidak mencukupi
    }
  }
}

void main() {
  // Pengujian
  Barang barang1 = Barang(nama: "Buku Tulis", harga: 5000, stok: 10);

  print("Stok Awal: ${barang1.stok}");
  
  // Coba jual 3 pcs
  bool suksesJual1 = barang1.jual(3);
  print("Jual 3 pcs: ${suksesJual1 ? 'Berhasil' : 'Gagal'}, Sisa Stok: ${barang1.stok}");

  // Coba jual 10 pcs (stok tidak cukup)
  bool suksesJual2 = barang1.jual(10);
  print("Jual 10 pcs: ${suksesJual2 ? 'Berhasil' : 'Gagal (Stok Kurang)'}, Sisa Stok: ${barang1.stok}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RPL-12.2-603 – Enkapsulasi'),
          backgroundColor: Colors.teal,
        ),
        body: const Center(
          child: Text(
            "Cek hasil di Terminal / Debug Console!",
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}