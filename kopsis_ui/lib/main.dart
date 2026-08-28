import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Data 10 barang
    final List<Map<String, dynamic>> daftarBarang = [
      {'nama': 'Buku Tulis', 'anggota': 3000, 'umum': 3500, 'stok': 40},
      {'nama': 'Pulpen', 'anggota': 2500, 'umum': 3000, 'stok': 25},
      {'nama': 'Roti', 'anggota': 5000, 'umum': 5500, 'stok': 15},
      {'nama': 'Penggaris', 'anggota': 2000, 'umum': 2500, 'stok': 10},
      {'nama': 'Pensil', 'anggota': 1500, 'umum': 2000, 'stok': 0},
      {'nama': ' Penghapus', 'anggota': 1000, 'umum': 1500, 'stok': 30},
      {'nama': 'Tip-Ex', 'anggota': 5000, 'umum': 6000, 'stok': 12},
      {'nama': 'Spidol Marker', 'anggota': 7000, 'umum': 8000, 'stok': 8},
      {'nama': 'Buku Gambar', 'anggota': 4500, 'umum': 5000, 'stok': 18},
      {'nama': 'Map Kertas', 'anggota': 1500, 'umum': 2000, 'stok': 50},
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Koperasi Sekolah')),
        body: ListView.builder(
          itemCount: daftarBarang.length,
          itemBuilder: (context, index) {
            final barang = daftarBarang[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: ListTile(
                leading: const Icon(Icons.inventory_2),
                title: Text(barang['nama']),
                subtitle: Text('Anggota Rp' + barang['anggota'].toString()),
                trailing: Text('Stok ' + barang['stok'].toString()),
              ),
            );
          },
        ),
      ),
    );
  }
}