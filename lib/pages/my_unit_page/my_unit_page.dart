import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bill_payments/bill_payment_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Urbanist', // Modern font
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
      backgroundColor: const Color(0xFFF5F5F5), // Light background
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MyUnitTitle(),
              const SizedBox(height: 20),
              UnitInfoSection(),
              const SizedBox(height: 16),
              PendingDuesSection(),
              const SizedBox(height: 20),
              Expanded(child: MyUnitOptions()),
            ],
          ),
        ),
      ),
    );
  }
}

class MyUnitTitle extends StatelessWidget {
  const MyUnitTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      'My Unit',
      style: TextStyle(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }
}

class UnitInfoSection extends StatelessWidget {
  const UnitInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Unit Details Page
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Unit No: A - Block-1',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SvgPicture.asset(
              'assets/icons/my_unit/unit.svg',
              width: 30,
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class PendingDuesSection extends StatelessWidget {
  const PendingDuesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to Bill Payment Page
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/my_unit/bill_payment.svg',
                  width: 24,
                  height: 24,
                  color: Colors.red,
                ),
                const SizedBox(width: 10),
                const Text(
                  'Pending Due:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Text(
              '₹5,300',
              style: TextStyle(
                fontSize: 18,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyUnitOptions extends StatelessWidget {
  const MyUnitOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3, // Three items per row
        crossAxisSpacing: 16, // Spacing between columns
        mainAxisSpacing: 16, // Spacing between rows
      ),
      itemCount: menuItems.length,
      itemBuilder: (context, index) {
        final item = menuItems[index];
        return _menuItem(
          context,
          item['iconPath'],
          item['label'],
        );
      },
    );
  }

  Widget _menuItem(BuildContext context, String iconPath, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Subtle shadow
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // Slightly offset
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 48, // SVG size
            height: 48,
          ),
          const SizedBox(height: 12), // Spacing between icon and text
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14, // Text size
              fontWeight: FontWeight.w500, // Medium weight
              color: Colors.black87, // Subtle color
            ),
          ),
        ],
      ),
    );
  }
}



// Menu items data
final List<Map<String, dynamic>> menuItems = [
  {
    'iconPath': 'assets/icons/my_unit/bill_payment.svg',
    'label': 'Bill Payment',
    'page': const BillPaymentPage(), // Replace with actual page
  },
  {
    'iconPath': 'assets/icons/my_unit/grocery.svg',
    'label': 'Groceries',
    'page': const Placeholder(),
  },
  {
    'iconPath': 'assets/icons/my_unit/gatekeeper.svg',
    'label': 'Gatekeeper',
    'page': const Placeholder(),
  },
  {
    'iconPath': 'assets/icons/my_unit/help.svg',
    'label': 'Help Desk',
    'page': const Placeholder(),
  },
  {
    'iconPath': 'assets/icons/my_unit/service.svg',
    'label': 'Request Service',
    'page': const Placeholder(),
  },
  {
    'iconPath': 'assets/icons/my_unit/facilities.svg',
    'label': 'Facilities',
    'page': const Placeholder(),
  },
  {
    'iconPath': 'assets/icons/my_unit/dining.svg',
    'label': 'Dining',
    'page': const Placeholder(),
  },
];
