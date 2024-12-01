import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart';
import 'package:flutter_project_1/widgets/service_grid.dart';

class ServicesPage extends StatelessWidget {
  final List<Map<String, dynamic>> goAnywhereOptions = [
    {
      "title": "Plumber",
      "icon": "assets/icons/consumer_service/icons/plumber.svg",
      "promo": false
    },
    {
      "title": "Electrician",
      "icon": "assets/icons/consumer_service/icons/electrician.svg",
      "promo": true
    },
    {
      "title": "Appliance repair",
      "icon": "assets/icons/consumer_service/icons/appliance.svg",
      "promo": false
    },
    {
      "title": "Junk Removal",
      "icon": "assets/icons/consumer_service/icons/junk_removal.svg",
      "promo": false
    },
    {
      "title": "Painting",
      "icon": "assets/icons/consumer_service/icons/painting.svg",
      "promo": false
    },
    {
      "title": "Furniture moving",
      "icon": "assets/icons/consumer_service/icons/furniture.svg",
      "promo": false
    },
  ];

  final List<Map<String, dynamic>> deliveryOptions = [
    {
      "title": "Grocery",
      "icon": "assets/icons/consumer_service/icons/grocery.svg",
      "promo": true
    },
    {
      "title": "Food",
      "icon": "assets/icons/consumer_service/icons/food.svg",
      "promo": true
    },
    {
      "title": "Flowers",
      "icon": "assets/icons/consumer_service/icons/flowers.svg",
      "promo": false
    },
  ];

  ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      appBar: AppBar(
        title: Text("Services",
            style: TextStyle(fontSize: 24, color: Colors.black)),
        backgroundColor: AppColors.appbarColor1,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle("Request Service"),
            ServiceGrid(options: goAnywhereOptions),
            buildSectionTitle("Community Hub"),
            ServiceGrid(options: deliveryOptions),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
