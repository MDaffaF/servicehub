import 'package:flutter/material.dart';
import 'login_page.dart'; // Gantilah dengan halaman selanjutnya

class RolePage extends StatelessWidget {
  const RolePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar perangkat
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Select a role',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Inter', // Apply the Inter font
              ),
            ),
            const SizedBox(height: 40),
            // Button 1: Looking for a specialist
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aksi yang ingin dilakukan jika tombol ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()), // Ganti dengan halaman selanjutnya
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.white, width: 2), // Mengubah warna border menjadi putih
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  minimumSize: Size(screenWidth * 0.8, 80), // Menyesuaikan lebar button dengan rasio layar
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, // Align items to start
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Looking for a specialist',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Inter', // Apply the Inter font
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            ' To place any type of order to search for a performer.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: 'Inter', // Apply the Inter font
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Image on the right and bigger
                    Image.asset(
                      'assets/icons/Buyer.png', // Ganti dengan path gambar buyer.png
                      height: 120, // Increased image size
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Button 2: Looking for a job
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Aksi yang ingin dilakukan jika tombol ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()), // Ganti dengan halaman selanjutnya
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.white, width: 2), // Mengubah warna border menjadi putih
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  minimumSize: Size(screenWidth * 0.8, 80), // Menyesuaikan lebar button dengan rasio layar
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start, // Align items to start
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Looking for a job',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontFamily: 'Inter', // Apply the Inter font
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            ' Search and execute orders in your field of activity',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: 'Inter', // Apply the Inter font
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Image on the right and bigger
                    Image.asset(
                      'assets/icons/Worker.png', // Ganti dengan path gambar worker.png
                      height: 120, // Increased image size
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            // Skip This Step Button
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  // Aksi jika tombol "Skip this step" ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()), // Ganti dengan halaman selanjutnya
                  );
                },
                child: const Text(
                  'Skip this step',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.orange,
                    fontFamily: 'Inter', // Apply the Inter font
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
