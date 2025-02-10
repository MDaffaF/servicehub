import 'dart:convert'; // Untuk encode/decode JSON

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

// final baseUrl = 'https://occasional-milena-afung22-768e817f.koyeb.app/';
final baseUrl = 'http://10.0.2.2:3000/';

Future<void> postUsers(Map data) async {

  // URL API yang akan dikirim data
  try {
    final response = await http.post(
      Uri.parse('${baseUrl}user'),
      headers: {
        'Content-Type': 'application/json', // Set header agar API tahu kita mengirim JSON
      },
      body: jsonEncode(data), // Konversi Map ke JSON
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Success: ${response.body}');
      logger.i(response.body);
    } else {
      print('Failed: ${response.statusCode} - ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<String> login(Map data) async {
  try {
    final response = await http.post(
      Uri.parse('${baseUrl}user/login'),
      headers: {
        'Content-Type': 'application/json', // Set header agar API tahu kita mengirim JSON
      },
      body: jsonEncode(data), // Konversi Map ke JSON
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Success: ${response.body}');
      logger.i(response.body);
      return response.body;
    } else {
      print('Failed: ${response.statusCode} - ${response.body}');
      return "error";
    }
  } catch (e) {
    print('Error: $e');
    return "error";
  }
}
