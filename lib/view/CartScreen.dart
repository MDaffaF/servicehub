import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servicehub/view/ProjectScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CartScreen(),
      routes: {
        '/projects': (context) => ProjectsScreen(),
      },
    );
  }
}

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<CartItem> cartItems = [
    CartItem(title: "House Cleaners", price: 20, quantity: 2, unit: "/ Hour", imageUrl: "assets/images/hc.png"),
    CartItem(title: "Electrical Help", price: 30, quantity: 1, unit: "/ Unit", imageUrl: "assets/images/eh.png"),
  ];

  String _address = "Ujung Berung City no 2 RT 11 RW 33 Bandung";
  bool _isEditing = false;

  void _updateQuantity(int index, int delta) {
    setState(() {
      if (cartItems[index].quantity + delta > 0) {
        cartItems[index].quantity += delta;
      }
    });
  }

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalPrice = cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        title: Text("Cart", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(item.imageUrl, width: 80, height: 80, fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.title, style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                              Text("\$${item.price}", style: GoogleFonts.poppins(fontSize: 14)),
                              Text(item.unit, style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey)),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () => _updateQuantity(index, -1),
                              icon: const Icon(Icons.remove_circle_outline),
                            ),
                            Text(item.quantity.toString(), style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold)),
                            IconButton(
                              onPressed: () => _updateQuantity(index, 1),
                              icon: const Icon(Icons.add_circle_outline),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () => _removeItem(index),
                          icon: const Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("ADDRESS", style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: _isEditing
                            ? TextField(
                                controller: TextEditingController(text: _address),
                                decoration: const InputDecoration(border: InputBorder.none, hintText: "Enter new address"),
                                onChanged: (value) => _address = value,
                              )
                            : Text(_address, style: GoogleFonts.poppins(fontSize: 14, color: Colors.black87), maxLines: 2, overflow: TextOverflow.ellipsis),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _isEditing = !_isEditing),
                        child: Text(_isEditing ? "SAVE" : "EDIT", style: GoogleFonts.poppins(color: Colors.orange, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("TOTAL : \$${totalPrice}", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                    ElevatedButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProjectsScreen())),
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12)),
                      child: Text("Order", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CartItem {
  final String title;
  final int price;
  int quantity;
  final String unit;
  final String imageUrl;

  CartItem({required this.title, required this.price, required this.quantity, required this.unit, required this.imageUrl});
}
