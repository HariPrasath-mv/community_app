import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bill_payments/bill_payment_page.dart';

class MyUnitPage extends StatelessWidget {
  const MyUnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              color: Colors.grey.shade500,
              offset: Offset(4.0, 4.0),
              blurRadius: 15,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15,
              spreadRadius: 1.0,
            )
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
              width: 40,
              height: 40,
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
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(4.0, 4.0),
              blurRadius: 15,
              spreadRadius: 1.0,
            ),
            BoxShadow(
              color: Colors.white,
              offset: Offset(-4.0, -4.0),
              blurRadius: 15,
              spreadRadius: 1.0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/my_unit/bill.svg',
                  width: 50,
                  height: 50,
                  // color: const Color.fromARGB(255, 255, 196, 0),
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
            color: Colors.grey.shade500,
            offset: Offset(4.0, 4.0),
            blurRadius: 15,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 15,
            spreadRadius: 1.0,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 40, // SVG size
            height: 40,
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
    'page': const BillPaymentPage(),
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
