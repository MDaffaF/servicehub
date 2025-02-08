import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SavedAddressesScreen(),
    );
  }
}

class SavedAddressesScreen extends StatefulWidget {
  const SavedAddressesScreen({Key? key}) : super(key: key);

  @override
  _SavedAddressesScreenState createState() => _SavedAddressesScreenState();
}

class _SavedAddressesScreenState extends State<SavedAddressesScreen> {
  List<String> addresses = [
    "Jl. Merdeka No. 10, Bandung",
    "Jl. Sudirman No. 20, Jakarta",
    "Jl. Diponegoro No. 15, Surabaya",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Addresses"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: addresses.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: ListTile(
              leading: const Icon(Icons.location_on, color: Colors.red),
              title: Text(addresses[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    addresses.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewAddress();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addNewAddress() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController addressController = TextEditingController();
        return AlertDialog(
          title: const Text("Add New Address"),
          content: TextField(
            controller: addressController,
            decoration: const InputDecoration(hintText: "Enter new address"),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () => Navigator.pop(context),
            ),
            TextButton(
              child: const Text("Add"),
              onPressed: () {
                setState(() {
                  if (addressController.text.isNotEmpty) {
                    addresses.add(addressController.text);
                  }
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
