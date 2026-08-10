import 'package:flutter/material.dart';

// 1. Class Barang dengan method nilaiStok()
class Barang {
  String nama;
  double harga;
  int stok;
  String kategori;

  Barang({
    required this.nama,
    required this.harga,
    required this.stok,
    required this.kategori,
  });

  // Method HOTS-1: Menghitung total nilai stok barang
  double nilaiStok() {
    return harga * stok;
  }

  // Method untuk menampilkan detail data barang
  void tampilkan() {
    print("====================");
    print("Nama        : $nama");
    print("Harga       : Rp$harga");
    print("Stok        : $stok");
    print("Kategori    : $kategori");
    print("Nilai Stok  : Rp${nilaiStok()}");
    print("====================");
  }
}

void main() {
  List<Barang> daftarBarang = [
    Barang(nama: "Buku Tulis", harga: 3000.0, stok: 20, kategori: "ATK"),
    Barang(nama: "Pulpen", harga: 2500.0, stok: 15, kategori: "ATK"),
    Barang(nama: "Roti", harga: 5000.0, stok: 10, kategori: "Makanan"),
  ];

  for (var barang in daftarBarang) {
    barang.tampilkan();
  }

  runApp(MyApp(daftarBarang: daftarBarang));
}

class MyApp extends StatelessWidget {
  final List<Barang> daftarBarang;

  const MyApp({super.key, required this.daftarBarang});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RPL-12.2-5S1 – HOTS-1'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: daftarBarang.length,
            itemBuilder: (context, index) {
              final b = daftarBarang[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: const Icon(Icons.inventory, color: Colors.blueAccent),
                  title: Text(b.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text("Harga: Rp${b.harga} | Stok: ${b.stok}\nTotal Nilai Aset: Rp${b.nilaiStok()}"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}