import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  // Formatter Rupiah
  final rupiah = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );

  // ==========================
  // RPL-12.2-102
  // KARTU DATA BARANG
  // ==========================

  String namaBarang = "Buku Tulis";
  double hargaAnggota = 3500;
  double hargaUmum = 4000;
  int jumlahStok = 0; // Hasil kedua: stok habis

  // RPL-12.2-1S1
  bool tersedia = jumlahStok > 0;

  print("===== KARTU DATA BARANG =====");
  print("Nama Barang: $namaBarang");
  print("Harga Anggota: ${rupiah.format(hargaAnggota)}");
  print("Harga Umum: ${rupiah.format(hargaUmum)}");
  print("Jumlah Stok: $jumlahStok");
  print("Tersedia: ${tersedia ? "Ya" : "Tidak"}");

  if (tersedia) {
    print("Status Barang: Tersedia");
  } else {
    print("Status Barang: Tidak Tersedia");
  }

  print("============================");

  // ==========================
  // RPL-12.2-103
  // PERHITUNGAN HARGA
  // ==========================

  int jumlahBeli = 3;

  double totalAnggota = jumlahBeli * hargaAnggota;
  double totalUmum = jumlahBeli * hargaUmum;
  double selisih = totalUmum - totalAnggota;

  print("");
  print("===== DATA PEMBELIAN =====");
  print("Nama Barang : $namaBarang");
  print("Jumlah Beli : $jumlahBeli");
  print("Harga Anggota : ${rupiah.format(hargaAnggota)}");
  print("Harga Umum : ${rupiah.format(hargaUmum)}");
  print("------------------------------");
  print("Total (anggota): ${rupiah.format(totalAnggota)}");
  print("Total (umum): ${rupiah.format(totalUmum)}");
  print("Selisih Harga: ${rupiah.format(selisih)}");
  print("==============================");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Belajar Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const MyHomePage(
        title: 'Aplikasi Belajar Flutter',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Formatter Rupiah
    final rupiah = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 0,
    );

    const String namaBarang = "Buku Tulis";
    const double hargaAnggota = 3500;
    const double hargaUmum = 4000;
    const int jumlahStok = 0;
    const int jumlahBeli = 3;

    final bool tersedia = jumlahStok > 0;

    final double totalAnggota = jumlahBeli * hargaAnggota;
    final double totalUmum = jumlahBeli * hargaUmum;
    final double selisih = totalUmum - totalAnggota;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'You have pushed the button this many times:',
                ),
                const SizedBox(height: 10),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 30),

                const Divider(),

                const Text(
                  'Kartu Data Barang',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text("Nama Barang : $namaBarang"),
                        Text("Harga Anggota : ${rupiah.format(hargaAnggota)}"),
                        Text("Harga Umum : ${rupiah.format(hargaUmum)}"),
                        Text("Jumlah Stok : $jumlahStok"),
                        Text("Tersedia : ${tersedia ? "Ya" : "Tidak"}"),
                        Text(
                          tersedia
                              ? "Status : Barang Tersedia"
                              : "Status : Barang Tidak Tersedia",
                          style: TextStyle(
                            color: tersedia ? Colors.green : Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Divider(),

                const Text(
                  "Perhitungan Pembelian",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text("Jumlah Beli : $jumlahBeli"),
                        Text(
                          "Total (Anggota) : ${rupiah.format(totalAnggota)}",
                        ),
                        Text(
                          "Total (Umum) : ${rupiah.format(totalUmum)}",
                        ),
                        Text(
                          "Selisih Harga : ${rupiah.format(selisih)}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorScheme.primary,
        foregroundColor: Colors.white,
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// RPL-12.2-104
// Pemilihan tipe data yang tepat membuat data kasir lebih akurat dan mudah diproses.
// Tipe data yang sesuai mengurangi kesalahan perhitungan harga, stok, dan status barang.
// Dengan demikian, transaksi di koperasi menjadi lebih cepat dan terpercaya.

// RPL-12.2-1S1
// Variabel bool 'tersedia' ditentukan berdasarkan jumlah stok.
// Jika jumlah stok lebih dari 0 maka tersedia bernilai true, sedangkan jika stok = 0 maka bernilai false.
// Status barang ditampilkan menggunakan kondisi if...else sehingga pengguna dapat mengetahui apakah barang masih tersedia.

// RPL-12.2-1S2
// Package intl digunakan untuk memformat angka menjadi format mata uang Rupiah.
// Dengan NumberFormat.currency(locale: 'id_ID'), harga ditampilkan menggunakan pemisah ribuan, misalnya Rp12.500.
// Format ini membuat nominal lebih mudah dibaca dan mengurangi kesalahan saat melakukan transaksi.