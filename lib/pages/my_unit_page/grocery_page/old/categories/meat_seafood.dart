import 'package:flutter/material.dart';

class MeatSeafoodPage extends StatelessWidget {
  const MeatSeafoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Meat & Seafood')),
      body: ListView(
        children: [
          ListTile(title: Text('Fresh Meat')),
          ListTile(title: Text('Poultry')),
          ListTile(title: Text('Seafood')),
          ListTile(title: Text('Processed Meat')),
        ],
      ),
    );
  }
}
