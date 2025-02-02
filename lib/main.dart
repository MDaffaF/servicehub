import 'package:flutter/material.dart';
import 'splash_page.dart';  // Ganti dengan halaman utama kamu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Service Hub',  // Ganti dengan nama aplikasi kamu
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,  // Menghilangkan banner debug
      home: const SplashScreen(),  // Halaman pertama yang muncul
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Menambahkan delay 3 detik untuk menampilkan splash screen
    Future.delayed(const Duration(seconds: 3), () {
      // Setelah delay, pindah ke halaman utama
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SplashPage()), // Ganti dengan halaman utama
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'assets/icons/Logo_app.png',  // Path gambar logo
          width: 200,  // Sesuaikan ukuran logo
          fit: BoxFit.contain,  // Agar logo tidak terdistorsi
        ),
      ),
    );
  }
}
