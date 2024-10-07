import 'dart:io';

// Fungsi untuk mencetak piramida bintang
void cetakPiramida(int panjang) {
  for (int i = 1; i <= panjang; i++) {
    // Cetak spasi untuk setiap baris
    String spasi = ' ' * (panjang - i);
    
    // Cetak bintang yang membentuk piramida
    String bintang = '*' * (2 * i - 1);
    
    // Gabungkan spasi dan bintang, lalu cetak
    print(spasi + bintang);
  }
}

void main() {
  // Menerima input panjang piramida dari user
  stdout.write("Masukkan panjang piramida: ");
  int? panjang = int.tryParse(stdin.readLineSync()!);

  // Validasi input
  if (panjang != null && panjang > 0) {
    cetakPiramida(panjang); // Panggil fungsi untuk mencetak piramida
  } else {
    print("Input tidak valid. Masukkan angka yang lebih besar dari 0.");
  }
}
