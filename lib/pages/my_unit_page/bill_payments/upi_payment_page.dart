import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_project_1/widgets/colors.dart';

class UpiPaymentPage extends StatelessWidget {
  final double totalAmount; // Accept total balance as a parameter

  const UpiPaymentPage({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    final TextEditingController amountController =
        TextEditingController(text: totalAmount.toStringAsFixed(2));

    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor1,
        title: const Text('UPI Payment',
            style: TextStyle(color: AppColors.fontColor2)),
        iconTheme: const IconThemeData(
          color: AppColors.appbariconColor2,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter UPI ID',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const TextField(
              decoration: InputDecoration(
                labelText: 'e.g., username@upi',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.account_balance_wallet,
                    color: Color(0xFF101935)),
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Saved UPI IDs',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text('No saved UPI IDs available',
                style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20.0),
            const Text(
              'Amount to Pay',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: amountController,
              decoration: const InputDecoration(
                labelText: 'Amount in ₹',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.currency_rupee),
              ),
              keyboardType: TextInputType.number,
              readOnly: true, // Make the field read-only
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Choose Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3, // Three columns
                crossAxisSpacing: 25.0,
                mainAxisSpacing: 20.0,
                children: [
                  PaymentOptionTile(
                    svgPath: 'assets/icons/payments/gpay.svg',
                    label: 'GPay',
                    onTap: () {
                      // Handle GPay selection
                      print('GPay Selected');
                    },
                  ),
                  PaymentOptionTile(
                    svgPath: 'assets/icons/payments/paytm.svg',
                    label: 'Paytm',
                    onTap: () {
                      // Handle Paytm selection
                      print('Paytm Selected');
                    },
                  ),
                  PaymentOptionTile(
                    svgPath: 'assets/icons/payments/phonepe.svg',
                    label: 'PhonePe',
                    onTap: () {
                      // Handle PhonePe selection
                      print('PhonePe Selected');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add payment logic here
                  print('Proceeding to Pay');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF101935),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40.0, vertical: 16.0),
                ),
                child: const Text(
                  'Proceed to Pay',
                  style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            const Center(
              child: Text(
                'Ensure UPI ID and Amount are correct before proceeding.',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOptionTile extends StatelessWidget {
  final String svgPath;
  final String label;
  final VoidCallback onTap;

  const PaymentOptionTile({
    super.key,
    required this.svgPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgPath,
            width: 60,
            height: 80,
          ),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
