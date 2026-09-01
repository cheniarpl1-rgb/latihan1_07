import 'package:flutter/material.dart';

class KeranjangItem extends StatefulWidget {
  final int stok;
  final int harga; // Menambahkan parameter harga

  const KeranjangItem({
    super.key,
    required this.stok,
    required this.harga,
  });

  @override
  State<KeranjangItem> createState() => _KeranjangItemState();
}

class _KeranjangItemState extends State<KeranjangItem> {
  int jumlah = 1;

  @override
  Widget build(BuildContext context) {
    int totalHarga = jumlah * widget.harga; // Menghitung total harga

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Menampilkan Total Harga
        Text(
          'Total: Rp$totalHarga',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (jumlah > 1) jumlah--;
            });
          },
        ),
        Text(jumlah.toString()),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            if (jumlah < widget.stok) {
              setState(() {
                jumlah++;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Jumlah tidak boleh melebihi stok!'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}