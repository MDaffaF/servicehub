import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:servicehub/tools/api.dart';
import 'package:servicehub/view/homescreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '';
  String password = '';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Fungsi untuk menekan tombol Continue
  Future<void> _continueLogin() async {
    // Logic untuk proses login (misalnya, validasi dan navigasi ke halaman lain)
    final Map<String, dynamic> data = {
                          'email': _emailController.text,
                          'password': _passwordController.text,
                        };

    var response = jsonDecode(await login(data));

    if (response['status'] != 200) {   
      print(response['error']);

    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Homescreen()), // Assuming AddresaccesPage is a StatelessWidget or StatefulWidget
      );
    }
                        
    if (kDebugMode) {
      print(
        "Email: ${_emailController.text}, Password: ${_passwordController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigasi kembali ke halaman sebelumnya
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Judul Login
            const Text(
              'Login to your account',
              style: TextStyle(
                fontFamily: 'Inter', // Use Inter font family
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Email Address
            buildInputField('Email Address', 'Enter your email',
                controller: _emailController),

            const SizedBox(height: 20),

            // Password
            buildInputField('Password', 'Enter your password',
                obscureText: true, controller: _passwordController),

            const SizedBox(height: 20),

            // Continue Button
            SizedBox(
              width: double.infinity, // Tombol memenuhi lebar parent
              child: ElevatedButton(
                onPressed: _continueLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: email.isNotEmpty && password.isNotEmpty ? Colors.orange : Colors.grey,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                      fontFamily: 'Inter', // Use Inter font family
                      fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk membangun input field
  Widget buildInputField(String label, String hint,
      {bool obscureText = false, TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
                fontFamily: 'Inter', // Use Inter font family
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            obscureText: obscureText,
            onChanged: (value) {
              if (label == 'Password') {
                setState(() {
                  password = value;
                });
              }
              if (label == 'Email Address') {
                setState(() {
                  email = value;
                });
              }
            },
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
