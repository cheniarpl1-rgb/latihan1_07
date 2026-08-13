import 'package:flutter/material.dart';

// Fungsi prosesBeli sesuai instruksi tugas RPL-12.2-702
void prosesBeli(String inputJumlah) {
  try {
    // 1. Ubah input string menjadi integer
    int jumlah = int.parse(inputJumlah);
    
    // 2. Proses penjualan jika berhasil parse
    print("[SUKSES] Transaksi diproses untuk $jumlah barang.");
  } catch (e) {
    // 3. Tampilkan pesan ramah jika input salah/bukan angka
    print("[PERINGATAN] Mohon masukkan jumlah berupa angka yang valid, silakan coba lagi.");
  } finally {
    // 4. Selalu catat log transaksi
    print("Transaksi dicatat di log.\n");
  }
}

void main() {
  // Pengujian Fungsi di Terminal / Debug Console
  print("=== UJI COBA FUNGSI PROSES BELI ===\n");

  print("--- Pengujian 1 (Input Benar: '5') ---");
  prosesBeli("5");

  print("--- Pengujian 2 (Input Salah: 'dua') ---");
  prosesBeli("dua");

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
          title: const Text('RPL-12.2-702 – Notifikasi & Try-Catch'),
          backgroundColor: Colors.teal,
        ),
        body: const Center(
          child: Text(
            "Cek hasil pengujian di Terminal / Debug Console!",
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}