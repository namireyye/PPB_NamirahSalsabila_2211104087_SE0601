import 'dart:io';

// Fungsi untuk mengevaluasi nilai dan mengembalikan grade
String hitungGrade(int nilai) {
  if (nilai >= 90 && nilai <= 100) {
    return "A";
  } else if (nilai >= 75 && nilai < 90) {
    return "B";
  } else if (nilai >= 60 && nilai < 75) {
    return "C";
  } else if (nilai >= 50 && nilai < 60) {
    return "D";
  } else if (nilai >= 0 && nilai < 50) {
    return "E";
  } else {
    return "Nilai tidak valid"; // Nilai di luar rentang 0-100
  }
}

void main() {
  // Meminta input nilai dari user
  stdout.write("Masukkan nilai (0-100): ");
  String? input = stdin.readLineSync();
  
  // Validasi apakah input berupa angka
  if (input != null && input.isNotEmpty) {
    int? nilai = int.tryParse(input);
    
    if (nilai != null) {
      // Evaluasi nilai dan tampilkan hasil
      String grade = hitungGrade(nilai);
      if (grade == "Nilai tidak valid") {
        print(grade);
      } else {
        print("Nilai $nilai mendapatkan grade $grade");
      }
    } else {
      print("Input bukan angka yang valid.");
    }
  } else {
    print("Input kosong atau tidak valid.");
  }
}
