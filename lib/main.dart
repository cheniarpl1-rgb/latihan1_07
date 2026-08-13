import 'dart:async';

// 1. Fungsi Asinkron Memuat Laporan
Future<void> muatLaporan() async {
  print("=== SISTEM KASIR BRANTAS MART ===");
  print("Memuat laporan...");
  await Future.delayed(const Duration(seconds: 1));
  print("Laporan siap!\n");
}

// 2. Tampilkan Barang
void tampilkanBarang(String nama, int harga, int stok) {
  print("--- DAFTAR BARANG ---");
  print("Nama Barang : $nama | Harga: Rp $harga | Stok: $stok unit\n");
}

// 3. Proses Transaksi (Penanganan Salah Input & Diskon)
void prosesTransaksi(String inputJumlah, bool isAnggota, int harga, Map<String, int> dataStok) {
  print("--- PROSES TRANSAKSI ---");
  try {
    int jumlah = int.parse(inputJumlah);

    if (jumlah <= 0 || jumlah > dataStok['stok']!) {
      print("Galat: Jumlah beli tidak valid atau stok tidak mencukupi!");
      return;
    }

    int total = jumlah * harga;
    double diskon = isAnggota ? 0.10 : 0.0;
    double totalBayar = total - (total * diskon);

    dataStok['stok'] = dataStok['stok']! - jumlah;

    print("Status Anggota : ${isAnggota ? 'Ya (Diskon 10%)' : 'Tidak'}");
    print("Jumlah Beli    : $jumlah unit");
    print("Total Bayar    : Rp ${totalBayar.toInt()}");
    print("Sisa Stok      : ${dataStok['stok']} unit");
    print(">> Transaksi Berhasil! <<\n");
  } catch (e) {
    print("Galat: Input jumlah tidak valid! Harus berupa angka.");
  } finally {
    print("Proses transaksi selesai.");
  }
}

void main() async {
  String namaBarang = "Buku Tulis";
  int hargaBarang = 5000;
  var dataStok = {'stok': 20};

  // Alur Program Mengalir
  await muatLaporan();
  tampilkanBarang(namaBarang, hargaBarang, dataStok['stok']!);
  prosesTransaksi("3", true, hargaBarang, dataStok);
}