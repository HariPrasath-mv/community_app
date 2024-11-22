import 'package:flutter/material.dart';

class HealthBeautyPage extends StatelessWidget {
  const HealthBeautyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Health & Beauty')),
      body: ListView(
        children: [
          ListTile(title: Text('Personal Care')),
          ListTile(title: Text('Skincare')),
          ListTile(title: Text('Hair Care')),
          ListTile(title: Text('Vitamins & Supplements')),
        ],
      ),
    );
  }
}
