import 'package:flutter/material.dart';

class BakeryBreadPage extends StatelessWidget {
  const BakeryBreadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bakery & Bread')),
      body: ListView(
        children: [
          ListTile(title: Text('Bread')),
          ListTile(title: Text('Bagels')),
          ListTile(title: Text('Pastries')),
          ListTile(title: Text('Cakes')),
        ],
      ),
    );
  }
}
