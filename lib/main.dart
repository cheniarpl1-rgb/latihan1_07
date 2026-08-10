import 'package:flutter/material.dart';

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

  // Method HOTS-1: Menghitung total nilai stok
  double nilaiStok() {
    return harga * stok;
  }

  // Method HOTS-2: Mengecek apakah stok mencukupi
  bool bisaDijual(int diminta) {
    return stok >= diminta;
  }

  void tampilkan() {
    print("====================");
    print("Nama        : $nama");
    print("Harga       : Rp$harga");
    print("Stok        : $stok");
    print("Kategori    : $kategori");
    print("Nilai Stok  : Rp${nilaiStok()}");
    print("Bisa dijual 5  : ${bisaDijual(5)}");
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
    int jumlahBeliContoh = 12; // Contoh uji coba beli 12 unit

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RPL-12.2-5S2 – HOTS-2'),
          backgroundColor: Colors.indigo,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: daftarBarang.length,
            itemBuilder: (context, index) {
              final b = daftarBarang[index];
              final statusBeli = b.bisaDijual(jumlahBeliContoh);

              return Card(
                margin: const EdgeInsets.only(bottom: 10),
                child: ListTile(
                  leading: Icon(
                    statusBeli ? Icons.check_circle : Icons.cancel,
                    color: statusBeli ? Colors.green : Colors.red,
                    size: 36,
                  ),
                  title: Text(b.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                    "Stok: ${b.stok} | Minta: $jumlahBeliContoh\nStatus: ${statusBeli ? 'Tersedia/Bisa Dijual' : 'Stok Tidak Cukup'}",
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}