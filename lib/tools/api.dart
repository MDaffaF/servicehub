import 'dart:convert'; // Untuk encode/decode JSON

import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';
import 'package:logger/logger.dart';

var logger = Logger(
  printer: PrettyPrinter(),
);

final baseUrl = 'https://occasional-milena-afung22-768e817f.koyeb.app/';
// final baseUrl = 'http://10.0.2.2:3000/';

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

Future<String> getOneUser({required int id}) async {
  try {
    final response = await http.get(Uri.parse('${baseUrl}user/$id'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      // print('Success: ${response.body}');
      return response.body; // Return raw JSON string
    } else {
      print('Failed: ${response.statusCode} - ${response.body}');
      return '{"error": "User not found"}'; // Return valid JSON format
    }
  } catch (e) {
    print('Error: $e');
    return '{"error": "Network error"}';
  }
}

Future<List<Map<String, dynamic>>> getTechnicians() async {
    print("masuk kesini");
  try {
    final response = await http.get(Uri.parse('${baseUrl}job'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Success: ${response.body}');

      List data = jsonDecode(response.body); 
      List<Map<String, dynamic>> dataUser = []; 

      for (var element in data) {
        try {
          String userJson = await getOneUser(id: element['user_id']); 
          Map<String, dynamic> temp = jsonDecode(userJson); 

          dataUser.add({
            "id": element['id'],
            "user_id": element['user_id'],
            "name": "${temp['first_name']} ${temp['last_name']}",
            "speciality": element['job_name'],
            "rating": 4.7,
            "price": "${element['price']}/hour",
            "photo": "assets/icons/teknisi.png",
            "description": element['description']

          });
        } catch (e) {
          print("Error fetching user data: $e");
        }
      }

      print("Final Data: ${jsonEncode(dataUser)}");
      return dataUser; 
    } else {
      print('Failed: ${response.statusCode} - ${response.body}');
      return [];
    }
  } catch (e) {
    print('Error: $e');
    return [];
  }
}

Future<void> addToCart(Map data) async {

  // URL API yang akan dikirim data
  try {
    final response = await http.post(
      Uri.parse('${baseUrl}order'),
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

Future<String> getOneJob({required int id}) async {
  try {
    print("masuk kesini");
    final response = await http.get(Uri.parse('${baseUrl}job/$id'));

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      print('Failed: ${response.statusCode} - ${response.body}');
      return '{"error": "Job not found"}'; 
    }
  } catch (e) {
    print('Error: $e');
    return '{"error": "Network error"}';
  }
}

Future<String> getCart() async {
  await initLocalStorage();

  try {
    final response = await http.post(
      Uri.parse('${baseUrl}order/cart'),
      headers: {
        'Content-Type': 'application/json', // Set header agar API tahu kita mengirim JSON
      },
      body: jsonEncode({
        "user_id": localStorage.getItem('user_id'),
        "status": "in cart"
      }), // Konversi Map ke JSON
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      logger.i(response.body);
      print('Success: ${response.body}');

      var dataCart = [];  // Initialize as an empty list
      var responseBody = jsonDecode(response.body);  // Decode the JSON response

      // Access the 'data' field which is a map (not a list)
      var data = responseBody['data'];

      // Since 'data' is a map, we need to handle it as such
      if (data != null) {
        // For example, if you want to extract job_id from the map and fetch job details
        String jobJson = await getOneJob(id: data['job_id']);
        try {
          print(jsonDecode(jobJson));
          Map<String, dynamic> temp = jsonDecode(jobJson);

          // Add the job details to dataCart (based on the 'data' map)
          dataCart.add({
            "id": data['id'],
            "user_id": data['user_id'],
            "job_id": data['job_id'],
            "speciality": temp['job_name'],
            "price": "${temp['price']}/hour",
            "photo": "assets/icons/teknisi.png",
          });
        } catch (e) {
          print("Error fetching job data: $e");
        }
      } else {
        print("No 'data' found in response.");
      }

      // Return the processed data (or do something with dataCart)
      print("Final Data: ${jsonEncode(dataCart)}");

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
