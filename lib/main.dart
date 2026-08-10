import 'package:flutter/material.dart';

// 1. Class Barang dengan atribut lengkap sesuai output
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

  // Method untuk menampilkan format data barang
  void tampilkan() {
    print("====================");
    print("Nama     : $nama");
    print("Harga    : Rp$harga");
    print("Stok     : $stok");
    print("Kategori : $kategori");
    print("====================");
  }
}

void main() {
  // 2. Simpan ketiga objek ke List<Barang>
  List<Barang> daftarBarang = [
    Barang(
      nama: "Buku Tulis",
      harga: 3000.0,
      stok: 20,
      kategori: "ATK",
    ),
    Barang(
      nama: "Pulpen",
      harga: 2500.0,
      stok: 15,
      kategori: "ATK",
    ),
    Barang(
      nama: "Roti",
      harga: 5000.0,
      stok: 10,
      kategori: "Makanan",
    ),
  ];

  // 3. Tampilkan semua menggunakan perulangan (for-in loop)
  for (var barang in daftarBarang) {
    barang.tampilkan();
  }

  /*
  =========================================================================
  KOMENTAR PERBANDINGAN DENGAN SPRINT 3:
  =========================================================================
  1. Pengelolaan Data Lebih Rapi:
     Di Sprint 3, data harus dipanggil satu per satu secara manual. Dengan 
     List<Barang>, cukup panggil method tampilkan() di dalam perulangan.

  2. Efisiensi & Fleksibilitas:
     Jika ada penambahan barang baru, kita cukup memasukkannya ke dalam List 
     tanpa perlu menambah baris kode cetak (print) baru.
  =========================================================================
  */

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Cek Terminal / Debug Console untuk melihat output!'),
        ),
      ),
    );
  }
}