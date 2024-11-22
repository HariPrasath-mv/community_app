import 'package:flutter/material.dart';

class FrozenFoodsPage extends StatelessWidget {
  const FrozenFoodsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Frozen Foods')),
      body: ListView(
        children: [
          ListTile(title: Text('Frozen Vegetables')),
          ListTile(title: Text('Frozen Meals')),
          ListTile(title: Text('Ice Cream & Desserts')),
          ListTile(title: Text('Frozen Meat & Seafood')),
        ],
      ),
    );
  }
}
