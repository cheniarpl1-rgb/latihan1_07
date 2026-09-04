import 'package:flutter/material.dart';

class KeranjangItem extends StatefulWidget {
  final int stok;
  final int harga;

  const KeranjangItem({
    super.key,
    required this.stok,
    required this.harga,
  });

  @override
  State<KeranjangItem> createState() => _KeranjangItemState();
}

class _KeranjangItemState extends State<KeranjangItem> {
  int jumlah = 0;

  @override
  void initState() {
    super.initState();
    print('initState dipanggil');
  }

  @override
  void dispose() {
    print('dispose dipanggil');
    super.dispose();
  }

  void _tambahJumlah() {
    if (jumlah < widget.stok) {
      setState(() {
        jumlah++;
      });
    }
  }

  void _kurangiJumlah() {
    if (jumlah > 0) {
      setState(() {
        jumlah--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('build dipanggil');

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: _kurangiJumlah,
        ),
        Text(
          '$jumlah',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _tambahJumlah,
        ),
      ],
    );
  }
}