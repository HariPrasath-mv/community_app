import 'package:flutter/material.dart';

class DairyEggsPage extends StatelessWidget {
  const DairyEggsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dairy & Eggs')),
      body: ListView(
        children: [
          ListTile(title: Text('Milk')),
          ListTile(title: Text('Cheese')),
          ListTile(title: Text('Yogurt')),
          ListTile(title: Text('Butter')),
          ListTile(title: Text('Eggs')),
        ],
      ),
    );
  }
}
