import 'package:flutter/material.dart';
import 'my_family_page.dart';
import 'my_pets_page.dart';
import 'my_vehicles_page.dart';

class UnitDetailsPage extends StatelessWidget {
  const UnitDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Unit Details', style: TextStyle(color: Color(0xFFFFFFFF)),),
      centerTitle: true,
      backgroundColor: Color(0xFF101935),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _unitDetailOption(context, Icons.family_restroom, 'My Family', const MyFamilyPage()),
          _unitDetailOption(context, Icons.pets, 'My Pets', const MyPetsPage()),
          _unitDetailOption(context, Icons.directions_car, 'My Vehicles', const MyVehiclesPage()),
        ],
      ),
    );
  }

  Widget _unitDetailOption(BuildContext context, IconData icon, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const SizedBox(width: 16),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
