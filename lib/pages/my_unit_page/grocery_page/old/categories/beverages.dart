import 'package:flutter/material.dart';

class BeveragesPage extends StatelessWidget {
  const BeveragesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Beverages')),
      body: ListView(
        children: [
          ListTile(title: Text('Juices')),
          ListTile(title: Text('Soft Drinks')),
          ListTile(title: Text('Tea & Coffee')),
          ListTile(title: Text('Water')),
          ListTile(title: Text('Alcoholic Beverages')),
        ],
      ),
    );
  }
}
