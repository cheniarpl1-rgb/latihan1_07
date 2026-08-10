import 'package:flutter/material.dart';

// 1. Class Barang
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

  double nilaiStok() {
    return harga * stok;
  }

  bool bisaDijual(int diminta) {
    return stok >= diminta;
  }
}

// 2. Class Pembeli (HOTS-3)
class Pembeli {
  String nama;
  bool isAnggota; // Status anggota koperasi (True / False)

  Pembeli({
    required this.nama,
    required this.isAnggota,
  });

  // Method untuk menghitung total belanja setelah diskon anggota (misal diskon 10%)
  double hitungTotal(Barang barang, int jumlah) {
    double total = barang.harga * jumlah;
    if (isAnggota) {
      total = total * 0.9; // Diskon 10% untuk anggota
    }
    return total;
  }
}

void main() {
  List<Barang> daftarBarang = [
    Barang(nama: "Buku Tulis", harga: 3000.0, stok: 20, kategori: "ATK"),
    Barang(nama: "Pulpen", harga: 2500.0, stok: 15, kategori: "ATK"),
  ];

  Pembeli pembeli1 = Pembeli(nama: "Budi", isAnggota: true);

  print("Pembeli: ${pembeli1.nama} (Anggota: ${pembeli1.isAnggota})");
  print("Membeli 5 Buku Tulis, Total: Rp${pembeli1.hitungTotal(daftarBarang[0], 5)}");

  runApp(MyApp(daftarBarang: daftarBarang, pembeli: pembeli1));
}

class MyApp extends StatelessWidget {
  final List<Barang> daftarBarang;
  final Pembeli pembeli;

  const MyApp({super.key, required this.daftarBarang, required this.pembeli});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RPL-12.2-5S3 – HOTS-3'),
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                color: Colors.teal.shade50,
                child: ListTile(
                  leading: const Icon(Icons.person, color: Colors.teal),
                  title: Text("Pembeli: ${pembeli.nama}"),
                  subtitle: Text(
                    "Status: ${pembeli.isAnggota ? 'Anggota Koperasi (Diskon 10%)' : 'Bukan Anggota'}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text("Daftar Transaksi:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: daftarBarang.length,
                  itemBuilder: (context, index) {
                    final b = daftarBarang[index];
                    int jumlahBeli = 5;
                    double totalHarga = pembeli.hitungTotal(b, jumlahBeli);

                    return Card(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: const Icon(Icons.shopping_cart, color: Colors.teal),
                        title: Text(b.nama),
                        subtitle: Text("Beli: $jumlahBeli pcs @ Rp${b.harga}"),
                        trailing: Text(
                          "Total: Rp${totalHarga.toStringAsFixed(0)}",
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.teal),
                        ),
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