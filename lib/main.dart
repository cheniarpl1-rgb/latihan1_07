import 'package:flutter/material.dart';

// 1. Class Barang dengan atribut sesuai output tugas
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

  // Method untuk menampilkan detail data barang ke konsol
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
  // 2. Menyimpan 3 objek ke dalam List<Barang>
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

  // 3. Menampilkan seluruh data memakai perulangan (for-in loop)
  for (var barang in daftarBarang) {
    barang.tampilkan();
  }

  /*
  =========================================================================
  KOMENTAR PERBANDINGAN DENGAN SPRINT 3:
  =========================================================================
  Apa yang lebih baik dibanding cara Sprint 3?

  1. Struktur Data Terorganisir (OOP Encapsulation):
     Di Sprint 3, data variabel dipanggil/dikelola secara terpisah. 
     Menggunakan List<Barang> membungkus atribut nama, harga, stok, dan 
     kategori ke dalam satu objek yang rapi dan terpusat.

  2. Efisiensi Perulangan & Pemanggilan Method:
     Di Sprint 3, pencetakan data dilakukan secara manual satu per satu. 
     Dengan List, cukup diproses melalui perulangan (looping) untuk memanggil 
     method tampilkan() secara otomatis.

  3. Akses Data Fleksibel & Dinamis:
     Penambahan atau pengurangan barang baru dapat dilakukan dengan mudah 
     pada List tanpa perlu menambah baris kode cetak (print) secara manual.
  =========================================================================
  */

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
          title: const Text('RPL-12.2-503 – List Barang'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Daftar Barang Koperasi",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: daftarBarang.length,
                  itemBuilder: (context, index) {
                    final b = daftarBarang[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: const Icon(Icons.inventory, color: Colors.blueAccent),
                        title: Text(b.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text("Harga: Rp${b.harga} | Stok: ${b.stok}\nKategori: ${b.kategori}"),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}