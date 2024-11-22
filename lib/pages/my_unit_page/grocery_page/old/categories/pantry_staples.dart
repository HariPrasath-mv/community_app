import 'package:flutter/material.dart';

class PantryStaplesPage extends StatelessWidget {
  const PantryStaplesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pantry Staples')),
      body: ListView(
        children: [
          ListTile(title: Text('Rice & Grains')),
          ListTile(title: Text('Pasta')),
          ListTile(title: Text('Sauces & Condiments')),
          ListTile(title: Text('Spices & Seasonings')),
          ListTile(title: Text('Baking Supplies')),
        ],
      ),
    );
  }
}
