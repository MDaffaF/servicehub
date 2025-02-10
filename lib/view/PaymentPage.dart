import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  String _selectedPaymentMethod = "COD";

  void _handlePayment() {
    // Save or send payment data based on the selected method
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment method: $_selectedPaymentMethod")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select Payment Method",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            RadioListTile(
              title: Row(
                children: [
                  Image.asset("assets/icons/cod.png", width: 40, height: 40),
                  const SizedBox(width: 10),
                  const Text("Cash on Delivery (COD)"),
                ],
              ),
              value: "COD",
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() => _selectedPaymentMethod = value.toString());
              },
            ),
            RadioListTile(
              title: Row(
                children: [
                  Image.asset("assets/icons/bank_transfer.png",
                      width: 40, height: 40),
                  const SizedBox(width: 10),
                  const Text("Virtual Account (Bank Transfer)"),
                ],
              ),
              value: "Bank Transfer",
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() => _selectedPaymentMethod = value.toString());
              },
            ),
            RadioListTile(
              title: Row(
                children: [
                  Image.asset("assets/icons/qris.png", width: 40, height: 40),
                  const SizedBox(width: 10),
                  const Text("QRIS"),
                ],
              ),
              value: "QRIS",
              groupValue: _selectedPaymentMethod,
              onChanged: (value) {
                setState(() => _selectedPaymentMethod = value.toString());
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handlePayment,
                child: const Text("Confirm Payment"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
