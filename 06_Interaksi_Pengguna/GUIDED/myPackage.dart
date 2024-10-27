import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mypackage extends StatefulWidget {
  const Mypackage({super.key});

  @override
  _MypackageState createState() => _MypackageState();
}

class _MypackageState extends State<Mypackage> {
  // const Mypackage({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedValue;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login dulu, yuk!',
          style: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 158, 24, 15),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                  // icon: Icon(Icons.email_outlined),
                  hintText: 'Masukkan Username',
                  prefixIcon: Icon(Icons.account_circle_outlined)),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              obscureText: true,
              obscuringCharacter: '@',
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(
                  // icon: Icon(Icons.lock_outline_rounded),
                  hintText: 'Masukkan Password',
                  prefixIcon: Icon(Icons.lock_outline_rounded)),
            ),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                onPressed: () {}, child: const Text('Login Sekarang')),
            const SizedBox(
              height: 16,
            ),
            TextButton(onPressed: () {}, child: const Text('Text Button')),
            const SizedBox(
              height: 32,
            ),
            DropdownButton<String>(
              value: selectedValue,
              hint: const Text('Pilih Opsi'),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
              items: <String>['Opsi 1', 'Opsi 2', 'Opsi 3']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}