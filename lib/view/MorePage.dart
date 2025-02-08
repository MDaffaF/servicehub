import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:servicehub/view/CartScreen.dart';
import 'package:servicehub/view/DetailPage.dart';
import 'package:servicehub/view/PaymentPage.dart';
import 'package:servicehub/view/ProjectScreen.dart';
import 'package:servicehub/view/addrespage.dart';
import 'package:servicehub/view/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MoreScreen(),
    );
  }
}

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  void _showRatingDialog(BuildContext context) {
    double rating = 0;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Rate Our App"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text("How many stars would you give us?"),
              const SizedBox(height: 10),
              StatefulBuilder(
                builder: (context, setState) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return IconButton(
                        icon: Icon(
                          index < rating ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 30,
                        ),
                        onPressed: () {
                          setState(() {
                            rating = (index + 1).toDouble();
                          });
                        },
                      );
                    }),
                  );
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("Submit"),
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text("Thank you for rating us $rating stars!")),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        "icon": Ionicons.card_outline,
        "title": "Payment Methods",
        "color": Colors.blue,
        "page": PaymentPage()
      },
      {
        "icon": Ionicons.location_outline,
        "title": "Saved Addresses",
        "color": Colors.grey,
        "page": SavedAddressesScreen()
      },
      {
        "icon": Ionicons.notifications_outline,
        "title": "Notifications",
        "color": Colors.red,
        "page": PaymentPage()
      },
      {
        "icon": Ionicons.heart_outline,
        "title": "Saved ServiceHub’s",
        "color": Colors.purple,
        "page": PaymentPage()
      },
      {
        "icon": Ionicons.star_outline,
        "title": "Rate our app",
        "color": Colors.orange,
        "page": () => _showRatingDialog(context)
      },
      {
        "icon": Ionicons.information_circle_outline,
        "title": "About Us",
        "color": Colors.cyan,
        "page": PaymentPage()
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title:
            const Text("More", style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hello, Nuraima Uswatun",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text("nuraima@servicehub.com",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Ionicons.person_outline,
                      size: 30, color: Colors.black),
                ),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            color: Colors.grey[100],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Invite your friends & get up to IDR 50,000",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Introduce your friends to the easiest way to find and hire professionals for your needs.",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: menuItems[index]["color"],
                    child: Icon(menuItems[index]["icon"], color: Colors.white),
                  ),
                  title: Text(menuItems[index]["title"],
                      style: const TextStyle(fontWeight: FontWeight.w500)),
                  onTap: () {
                    if (menuItems[index]["page"] is Widget) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => menuItems[index]["page"],
                        ),
                      );
                    } else {
                      menuItems[index]["page"]();
                    }
                  },
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("Version 1.0.0", style: TextStyle(color: Colors.grey)),
          ),
        ],
      ),
    );
  }
}
