import 'package:flutter_test/flutter_test.dart';
import 'package:latihan1_07/main.dart';

void main() {
  testWidgets('Pengujian tampilan List Barang Koperasi', (WidgetTester tester) async {
    // Memuat widget MyApp
    await tester.pumpWidget(const MyApp());

    // Memastikan judul halaman sesuai
    expect(find.text('RPL-12.2-503 – List Barang'), findsOneWidget);

    // Memastikan salah satu barang (misal: Buku Tulis) muncul di layar
    expect(find.text('Buku Tulis'), findsOneWidget);
  });
}