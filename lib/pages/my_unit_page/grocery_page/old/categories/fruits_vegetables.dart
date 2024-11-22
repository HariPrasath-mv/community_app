import 'package:flutter/material.dart';

class FruitsVegetablesPage extends StatelessWidget {
  const FruitsVegetablesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fruits & Vegetables')),
      body: ListView(
        children: [
          ListTile(title: Text('Fresh Fruits')),
          ListTile(title: Text('Fresh Vegetables')),
          ListTile(title: Text('Organic Products')),
        ],
      ),
    );
  }
}
