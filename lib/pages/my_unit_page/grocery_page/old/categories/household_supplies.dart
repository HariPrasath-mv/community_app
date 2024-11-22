import 'package:flutter/material.dart';

class HouseholdSuppliesPage extends StatelessWidget {
  const HouseholdSuppliesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Household Supplies')),
      body: ListView(
        children: [
          ListTile(title: Text('Cleaning Products')),
          ListTile(title: Text('Paper Goods')),
          ListTile(title: Text('Laundry Supplies')),
          ListTile(title: Text('Dishwashing Supplies')),
        ],
      ),
    );
  }
}
