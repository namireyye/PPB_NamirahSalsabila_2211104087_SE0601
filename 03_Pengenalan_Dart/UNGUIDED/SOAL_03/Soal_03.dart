import 'dart:io';

// Fungsi untuk mengecek apakah bilangan merupakan bilangan prima
bool cekPrima(int bilangan) {
  if (bilangan <= 1) {
    return false; // Bilangan 1 atau lebih kecil bukan bilangan prima
  }
  
  // Loop untuk memeriksa faktor pembagi dari 2 hingga akar kuadrat dari bilangan
  for (int i = 2; i <= bilangan ~/ i; i++) {
    if (bilangan % i == 0) {
      return false; // Jika habis dibagi bilangan lain, bukan bilangan prima
    }
  }
  
  return true; // Jika tidak ada faktor pembagi, bilangan prima
}

// Fungsi untuk menerima input dari user dan mencetak hasil pengecekan
void prosesBilanganPrima() {
  stdout.write("Masukkan sebuah bilangan bulat: ");
  String? input = stdin.readLineSync();
  
  // Memeriksa validitas input
  if (input != null && input.isNotEmpty) {
    int? bilangan = int.tryParse(input);
    
    if (bilangan != null) {
      // Mengecek apakah bilangan prima
      if (cekPrima(bilangan)) {
        print("$bilangan adalah bilangan prima.");
      } else {
        print("$bilangan bukan bilangan prima.");
      }
    } else {
      print("Input bukan bilangan bulat yang valid.");
    }
  } else {
    print("Input tidak boleh kosong.");
  }
}

void main() {
  // Memulai proses dengan memanggil fungsi utama
  prosesBilanganPrima();
}
