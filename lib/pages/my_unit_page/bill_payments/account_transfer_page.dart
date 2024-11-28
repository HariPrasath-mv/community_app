import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart';

class AccountTransferPage extends StatefulWidget {
  const AccountTransferPage({super.key});

  @override
  _AccountTransferPageState createState() => _AccountTransferPageState();
}

class _AccountTransferPageState extends State<AccountTransferPage> {
  // Card data
  final List<Map<String, dynamic>> cards = [
    {
      'cardNumber': '4002 **** **** 4568',
      'expiryDate': '06/32',
      'balance': '₹27,856.56', // Updated currency symbol
      'colors': [Colors.blue.shade300, Colors.green.shade300],
    },
    {
      'cardNumber': '1234 **** **** 7890',
      'expiryDate': '06/32',
      'balance': '₹5,640.99', // Updated currency symbol
      'colors': [Colors.orange.shade300, Colors.yellow.shade300],
    },
    {
      'cardNumber': '2059 **** **** 4722',
      'expiryDate': '06/32',
      'balance': '₹10,230.89', // Updated currency symbol
      'colors': [Colors.purple.shade300, Colors.pink.shade300],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      appBar: AppBar(
        title: const Text(
          'Card Payment',
          style: TextStyle(color: AppColors.fontColor2),
        ),
        backgroundColor: AppColors.appbarColor1,
        iconTheme: const IconThemeData(
          color: AppColors.appbariconColor2,
        ),
      ),
      body: Column(
        children: [
          // Container holding the stack of cards at the top
          SizedBox(
            height: 350,
            child: Stack(
              children: cards.asMap().entries.map((entry) {
                int index = entry.key;
                var card = entry.value;

                return Positioned(
                  top: index * 20.0,
                  left: 16,
                  right: 16,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // Move the tapped card to the top of the list
                        cards.insert(0, cards.removeAt(index));
                      });
                    },
                    child: buildCard(
                      colors: card['colors'],
                      cardNumber: card['cardNumber'],
                      expiryDate: card['expiryDate'],
                      balance: card['balance'], // Display INR symbol here
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 16), // Add spacing after the cards
          // Placeholder for other content below
          Expanded(
            child: Center(
              child: Text(
                'Additional content goes here...',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard({
    required List<Color> colors,
    required String cardNumber,
    required String expiryDate,
    required String balance,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      elevation: 8,
      child: Container(
        height: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Card Number and Expiry
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Card number',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Expire',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.9),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cardNumber,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  expiryDate,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              'Available balance',
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              balance, // INR balance displayed here
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
