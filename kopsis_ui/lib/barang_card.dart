import 'package:flutter/material.dart';
import 'keranjang_item.dart';

class BarangCard extends StatelessWidget {
  final String nama;
  final int hargaAnggota;
  final String kategori;
  final int stok;
  final bool sorot;

  const BarangCard({
    super.key,
    required this.nama,
    required this.hargaAnggota,
    required this.kategori,
    required this.stok,
    this.sorot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: sorot ? Colors.yellow[100] : Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.shopping_bag),
        title: Text(nama),
        subtitle: Text('Anggota Rp$hargaAnggota | Kategori: $kategori'),
        trailing: KeranjangItem(
          stok: stok,
          harga: hargaAnggota,
        ),
      ),
    );
  }
}