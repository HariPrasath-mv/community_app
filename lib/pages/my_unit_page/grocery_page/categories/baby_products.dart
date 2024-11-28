import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart';

class BabyProductsPage extends StatelessWidget {
  const BabyProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Baby Products'),
        backgroundColor: AppColors.appbarColor1,
      ),
      body: const Center(
        child: Text(
          'List of Baby Products',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),
    );
  }
}