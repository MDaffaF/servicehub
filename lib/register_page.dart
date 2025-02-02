import 'package:flutter/material.dart';
import 'addresacces_page.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isChecked = false;
  bool _isPasswordValid = false;
  bool _isPasswordLengthValid = false;
  bool _hasUpperCase = false;
  bool _hasLowerCase = false;
  bool _hasDigit = false;
  bool _hasSpecialCharacter = false;

  TextEditingController _passwordController = TextEditingController();

  // Fungsi untuk memvalidasi password sesuai kriteria
  void _validatePassword(String password) {
    setState(() {
      _hasUpperCase = password.contains(RegExp(r'[A-Z]'));
      _hasLowerCase = password.contains(RegExp(r'[a-z]'));
      _hasDigit = password.contains(RegExp(r'[0-9]'));
      _hasSpecialCharacter = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
      _isPasswordLengthValid = password.length >= 8;
      _isPasswordValid =
          _hasUpperCase && _hasLowerCase && _hasDigit && _hasSpecialCharacter && _isPasswordLengthValid;
    });
  }

  // Fungsi untuk berpindah ke AddresAccessPage
  void _onNextPressed() {
    if (_isChecked && _isPasswordValid) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AccessPage()),
      );
    } else {
      // Tampilkan pesan jika kriteria password atau checkbox belum terpenuhi
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please agree to the terms and ensure your password is valid.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Complete your info',
              style: TextStyle(
                fontFamily: 'Inter', // Applying the Inter font
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            buildInputField('First Name', 'Enter your first name'),
            buildInputField('Last Name', 'Enter your last name'),
            buildInputField('Email Address', 'Enter your email address'),
            buildInputField('Password', 'Enter your password', obscureText: true, controller: _passwordController),
            const SizedBox(height: 10),
            buildPasswordCriteria(),
            const SizedBox(height: 20),
            const Text(
              'By selecting Next, I agree to ServiceHub terms of service, '
              'Payment Terms of Service & Privacy Policy.',
              style: TextStyle(
                fontFamily: 'Inter', // Applying the Inter font
                fontSize: 14,
              ),
            ),
            // Checkbox aligned to the left of the text
            Row(
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                const Expanded(
                  child: Text(
                    'I agree to the terms and conditions',
                    style: TextStyle(
                      fontFamily: 'Inter', // Applying the Inter font
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isChecked && _isPasswordValid ? _onNextPressed : null, // Disable button if not checked or invalid password
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: Colors.white),
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
              fontFamily: 'Inter', // Applying the Inter font
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller,
            obscureText: obscureText,
            onChanged: (value) {
              if (label == 'Password') {
                _validatePassword(value);
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

  // Fungsi untuk menampilkan kriteria password
  Widget buildPasswordCriteria() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PasswordCriteria(
          text: 'One letter (a-z)',
          isValid: _hasLowerCase,
        ),
        PasswordCriteria(
          text: 'One number (0-9)',
          isValid: _hasDigit,
        ),
        PasswordCriteria(
          text: 'One special character',
          isValid: _hasSpecialCharacter,
        ),
        PasswordCriteria(
          text: '8 characters minimum',
          isValid: _isPasswordLengthValid,
        ),
      ],
    );
  }
}

// Widget untuk menampilkan kriteria password dengan validasi
class PasswordCriteria extends StatelessWidget {
  final String text;
  final bool isValid;

  const PasswordCriteria({super.key, required this.text, required this.isValid});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isValid ? Icons.check_circle : Icons.cancel,
          color: isValid ? Colors.green : Colors.red,
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontFamily: 'Inter', // Applying the Inter font
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
