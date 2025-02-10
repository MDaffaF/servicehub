import 'package:flutter/material.dart';
import 'role_page.dart';

class AccessPage extends StatefulWidget {
  const AccessPage({super.key});

  @override
  State<AccessPage> createState() => _AccessPageState();
}

class _AccessPageState extends State<AccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/icons/backgroundSpalshWhite.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Gambar "Allow Access"
                  Image.asset(
                    'assets/icons/Addres.png', // Ganti dengan gambar 'addres.png'
                    width: 150,
                    height: 150,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),

                  // Text yang menjelaskan izin akses
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'We need your location access to easily find Service Hub',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey, // White color text
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Inter', // Apply the Inter font
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'professionals around you',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey, // White color text
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Inter', // Apply the Inter font
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Tombol untuk Allow Location Access dengan warna putih dan background oranye
                  SizedBox(
                    width: double.infinity, // Lebar sama untuk kedua tombol
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const RolePage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange, // Orange background
                        foregroundColor: Colors.white, // White text
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16), // Padding seragam
                      ),
                      child: const Text(
                        'Allow Location Access',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Inter', // Apply the Inter font
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Teks "Skip This Step" yang dapat diklik
                  TextButton(
                    onPressed: () {
                      // Tambahkan aksi jika ingin melanjutkan tanpa izin lokasi
                    },
                    child: const Text(
                      'Skip This Step',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.orange, // Warna teks putih
                        fontWeight: FontWeight.bold, // Menebalkan teks
                        fontFamily: 'Inter', // Apply the Inter font
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
