import 'package:flutter/material.dart';

class BabyProductsPage extends StatelessWidget {
  const BabyProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Baby Products')),
      body: ListView(
        children: [
          ListTile(title: Text('Baby Food')),
          ListTile(title: Text('Diapers')),
          ListTile(title: Text('Baby Care Essentials')),
        ],
      ),
    );
  }
}
