import 'package:flutter/material.dart';
import 'package:servicehub/view/DetailPage.dart';
import 'package:servicehub/view/homescreen.dart';
import 'login_page.dart'; // Gantilah dengan halaman selanjutnya

class RolePage extends StatefulWidget {
  const RolePage({super.key});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/icons/backgroundSpalshWhite.png', // Path to background image
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
                children: <Widget>[
                  // Text for role selection
                  const Text(
                    'Select a role',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter', // Apply the Inter font
                    ),
                  ),
                  const SizedBox(height: 30), // Reduced space between title and buttons

                  // Button 1: Looking for a specialist
                  SizedBox(
                    width: double.infinity, // Ensure full width
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Homescreen()), // Ganti dengan halaman selanjutnya
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Colors.white, width: 2), // Mengubah warna border menjadi putih
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        minimumSize: const Size(double.infinity, 80), // Menyesuaikan lebar button dengan rasio layar
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center the content of the button
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Looking for a specialist',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'Inter', // Apply the Inter font
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'To place any type of order to search for a performer.',
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
                            height: 120, // Adjusted image size
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Reduced space between the buttons

                  // Button 2: Looking for a job
                  SizedBox(
                    width: double.infinity, // Ensure full width
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailPage()), // Ganti dengan halaman selanjutnya
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(color: Colors.white, width: 2), // Mengubah warna border menjadi putih
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        minimumSize: const Size(double.infinity, 80), // Menyesuaikan lebar button dengan rasio layar
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center the content of the button
                        children: [
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Looking for a job',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontFamily: 'Inter', // Apply the Inter font
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Search and execute orders in your field of activity.',
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
                            height: 120, // Adjusted image size
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20), // Reduced space between the buttons

                  // Skip This Step Button
                  Align(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
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
          ),
        ],
      ),
    );
  }
}