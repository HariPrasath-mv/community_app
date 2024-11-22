import 'package:flutter/material.dart';

class SnacksPage extends StatelessWidget {
  const SnacksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Snacks')),
      body: ListView(
        children: [
          ListTile(title: Text('Chips & Crisps')),
          ListTile(title: Text('Nuts & Seeds')),
          ListTile(title: Text('Candy')),
          ListTile(title: Text('Biscuits & Cookies')),
        ],
      ),
    );
  }
}
