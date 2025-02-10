import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:servicehub/tools/api.dart';
import 'package:servicehub/view/splash_page.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  // bool _isChecked = false;
  bool _isPasswordValid = false;
  bool _isPasswordLengthValid = false;
  bool _hasUpperCase = false;
  bool _hasLowerCase = false;
  bool _hasDigit = false;
  bool _hasSpecialCharacter = false;
  String password = "";
  String email = "";
  String firstname = "";
  String lastname = "";

@override
  void initState() {
    super.initState();
    _getDataUser();
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _firstnameController = TextEditingController();
  TextEditingController _lastnameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _getDataUser() async {
  await initLocalStorage();
  var userId =  localStorage.getItem('user_id');
  print(userId);
    var response = await getOneUser(id: int.parse(userId ?? "0") );
    print(response);
    setState(() {
      var data = jsonDecode(response);
      setState(() {
        _emailController = TextEditingController(text: data['email']);
        _firstnameController = TextEditingController(text: data['first_name']);
        _lastnameController = TextEditingController(text: data['last_name']);
        _passwordController = TextEditingController(text: data['password']);
        email = data['email'] ?? "";
        firstname = data['first_name'] ?? "";
        lastname = data['last_name'] ?? "";
        password = data['password'] ?? "";
      });
    });
  }


  void _validatePassword(String password) {
    setState(() {
      _hasUpperCase = password.contains(RegExp(r'[A-Z]'));
      _hasLowerCase = password.contains(RegExp(r'[a-z]'));
      _hasDigit = password.contains(RegExp(r'[0-9]'));
      _hasSpecialCharacter = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
      _isPasswordLengthValid = password.length >= 8;
      _isPasswordValid =
          _hasUpperCase && _hasLowerCase && _hasDigit && _hasSpecialCharacter && _isPasswordLengthValid;
    });
  }

  void _deleteUser() async {
    var response = await deleteUsers({"id": localStorage.getItem('user_id')});
    print(response);
    if (response == "Delete Success") {
      localStorage.clear();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                const SplashPage()), 
      );
    }
  }

  void _editUser() async {
    var response = await editUsers({
      "id": localStorage.getItem('user_id'),
      "email": email,
      "first_name": firstname,
      "last_name": lastname,
      "password": password
    });
    print(jsonDecode(response));
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
              'Change your profile',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            buildInputField('First Name', 'Enter your first name', obscureText: false, controller: _firstnameController),
            buildInputField('Last Name', 'Enter your last name', obscureText: false, controller: _lastnameController),
            buildInputField('Email Address', 'Enter your email address', obscureText: false, controller: _emailController),
            buildInputField('Password', 'Enter your password', obscureText: true, controller: _passwordController),
            const SizedBox(height: 10),
            buildPasswordCriteria(),
            const SizedBox(height: 20),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              SizedBox(
                width: 170,
                height: 50,
                child: ElevatedButton(
                  onPressed: _deleteUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Delete',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                width: 170,
                height: 50,
                child: ElevatedButton(
                  onPressed: _editUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    'Edit',
                    style: TextStyle(fontFamily: 'Inter', fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
              
            ],),
            
          ],
        ),
      ),
    );
  }

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
              fontFamily: 'Inter',
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
                setState(() {
                  password = value;
                });
              }
              if (label == 'Email Address') {
                setState(() {
                  email = value;
                });
              }
              if (label == 'First Name') {
                setState(() {
                  firstname = value;
                });
              }
              if (label == 'Last Name') {
                setState(() {
                  lastname = value;
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

  Widget buildPasswordCriteria() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PasswordCriteria(text: 'One letter (a-z)', isValid: _hasLowerCase),
        PasswordCriteria(text: 'One number (0-9)', isValid: _hasDigit),
        PasswordCriteria(text: 'One special character', isValid: _hasSpecialCharacter),
        PasswordCriteria(text: '8 characters minimum', isValid: _isPasswordLengthValid),
      ],
    );
  }
}

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
            fontFamily: 'Inter',
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
