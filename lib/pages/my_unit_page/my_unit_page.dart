import 'package:flutter/material.dart';
import 'package:flutter_project_1/colors.dart';
import 'unit_details/unit_details_page.dart'; // Import the Unit Details page
import 'bill_payments/bill_payment_page.dart';
import '../consumer_service_page/consumer_service_page.dart';
import '../my_unit_page/gatekeeper_page/gatekeeper_page.dart';
import '../my_unit_page/helpdesk_page/helpdesk_page.dart';
import '../my_unit_page/grocery_page/grocery_page.dart';
import '../my_unit_page/facilities_page/facilities_page.dart'; // New import for Facilities page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        dialogBackgroundColor: const Color(0xFF101935),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Urbanist', // Use a modern font
      ),
      home: const MyUnitPage(),
    );
  }
}

class MyUnitPage extends StatelessWidget {
  const MyUnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      appBar: AppBar(
        title:
            const Text('My Unit', style: TextStyle(color: AppColors.fontColor1)),
        centerTitle: true,
        backgroundColor: AppColors.appbarColor1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Unit info section with navigation
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UnitDetailsPage(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  // boxShadow: [
                  //   BoxShadow(
                  //       color: Colors.grey.withOpacity(0.3),
                  //       blurRadius: 10,
                  //       offset: const Offset(0, 1)),
                  // ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Unit No: A - Block-1',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.apartment_rounded,
                        size: 30, color: Color(0xFF101935)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Pending dues section
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BillPaymentPage()),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(12),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.3),
                  //     spreadRadius: 1,
                  //     blurRadius: 5,
                  //     offset: const Offset(0, 1),
                  //   ),
                  // ],

                  border: Border.all(color: Colors.red, width: 1),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.attach_money_outlined, color: Colors.red),
                        SizedBox(width: 10),
                        Text(
                          'Pending Due:',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        ),
                      ],
                    ),
                    const Text(
                      '₹5,300',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Menu section
            const SizedBox(height: 10),

            // GridView for menu options
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns
                  crossAxisSpacing: 10, // Spacing between columns
                  mainAxisSpacing: 10, // Spacing between rows
                  childAspectRatio: 1, // Aspect ratio for grid items
                ),
                itemCount: menuItems.length,
                itemBuilder: (context, index) {
                  final item = menuItems[index];
                  return _menuItem(
                    context,
                    item['icon'],
                    item['label'],
                    item['page'],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to create menu items
  Widget _menuItem(
      BuildContext context, IconData icon, String label, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(0, 255, 255, 255),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 30, color: const Color(0xFF000000)),
            const SizedBox(height: 10),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

// Menu items data
final List<Map<String, dynamic>> menuItems = [
  {
    'icon': Icons.payment,
    'label': 'Bill Payments',
    'page': const BillPaymentPage()
  },
  {
    'icon': Icons.shopping_cart,
    'label': 'Groceries',
    'page': const GroceryPage()
  },
  {
    'icon': Icons.security,
    'label': 'Gatekeeper',
    'page': const GatekeeperPage()
  },
  {
    'icon': Icons.help_outline,
    'label': 'Help Desk',
    'page': const HelpdeskPage()
  },
  {
    'icon': Icons.build,
    'label': 'Request Service',
    'page': const ConsumerServicePage()
  },
  {
    'icon': Icons.local_hotel, // Example icon for Facilities
    'label': 'Facilities',
    'page': FacilitiesPage() // New Facilities page
  },
  {
    'icon': Icons.hotel, // Example icon for Facilities
    'label': 'Dining',
    'page': FacilitiesPage() // New Facilities page
  }
];
