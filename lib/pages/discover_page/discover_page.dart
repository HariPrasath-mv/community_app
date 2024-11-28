import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart';
import 'add_item_page.dart'; // Import the Add Item Page.
// import 'item_details_page.dart'; // Import the Item Details Page.

class DiscoverPage extends StatelessWidget {

  final List<Map<String, dynamic>> listings = [
    {
      'title': 'Sony OLED Smart TV - 55 inch',
      'price': '₹6000',
      'status': 'SALE',
      'location': 'Sharlow Apartments, Bangalore',
      'image': 'assets/images/discover/sony_tv.png',
    },
    {
      'title': '7" Medical Mattress',
      'price': '₹2000',
      'status': 'SALE',
      'location': 'Sharlow Apartments, Bangalore',
      'image': 'assets/images/discover/mattress.png',
    },
    {
      'title': 'Comic Books',
      'price': 'Free',
      'status': 'FREE',
      'location': 'Sharlow Apartments, Bangalore',
      'image': 'assets/images/discover/comic_books.png',
    },
  ];

  DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Discover',
          style: TextStyle(color: AppColors.fontColor2),
        ),
        backgroundColor: AppColors.appbarColor1,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Search and My Listings
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: 'Search',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
              ],
            ),
          ),
          // Categories Section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Browse by Categories',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
      // Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemPage()),
          );
        },
        backgroundColor: const Color(0xFF101935),
        child: const Icon(
          Icons.add,
          color: Color(0xFFFFFFFF),
        ),
      ),
    );
  }
}
