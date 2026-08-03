import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi Belajar Flutter',
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  void incrementCounter() {
    setState(() {
      counter++;
    });
  }

  // Data Barang
  final String namaBarang = "Buku Tulis";
  final double hargaAnggota = 3500;
  final double hargaUmum = 4000;
  final int jumlahStok = 120;
  final bool tersedia = true;
  final int jumlahBeli = 3;

  @override
  Widget build(BuildContext context) {
    double totalAnggota = jumlahBeli * hargaAnggota;
    double totalUmum = jumlahBeli * hargaUmum;
    double selisih = totalUmum - totalAnggota;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Aplikasi Belajar Flutter"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              "Counter : $counter",
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "KARTU DATA BARANG",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nama Barang : $namaBarang"),
                    Text("Harga Anggota : Rp${hargaAnggota.toInt()}"),
                    Text("Harga Umum : Rp${hargaUmum.toInt()}"),
                    Text("Jumlah Stok : $jumlahStok"),
                    Text("Tersedia : ${tersedia ? "Ya" : "Tidak"}"),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              "PERHITUNGAN PEMBELIAN",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Card(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jumlah Beli : $jumlahBeli"),
                    Text("Total Anggota : Rp${totalAnggota.toInt()}"),
                    Text("Total Umum : Rp${totalUmum.toInt()}"),
                    Text("Selisih : Rp${selisih.toInt()}"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}