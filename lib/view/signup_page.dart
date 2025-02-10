import 'package:flutter/material.dart';
import 'register_page.dart';  // Ensure register_page.dart is imported

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();

  // Function to handle the SignUp button press
  void _continueSignUp() {
    // Logic to navigate to the RegisterPage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterScreen()), // Navigate to RegisterPage
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Navigate back to the previous screen
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
            // Sign Up Title with Inter font
            const Text(
              'Sign Up to Service Hub',
              style: TextStyle(
                fontFamily: 'Inter',  // Use Inter font family
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Email Address Field with Inter font
            buildInputField('Email Address', 'Enter your email', controller: _emailController),

            const SizedBox(height: 20),

            // Continue Button with Inter font
            SizedBox(
              width: double.infinity, // Button to take up full width
              child: ElevatedButton(
                onPressed: _continueSignUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: Colors.white),  // Inter font
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to build the input field (same as in the Register and Login pages)
  Widget buildInputField(String label, String hint, {TextEditingController? controller}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Inter',  // Use Inter font family
              fontSize: 16, 
              fontWeight: FontWeight.w500
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
