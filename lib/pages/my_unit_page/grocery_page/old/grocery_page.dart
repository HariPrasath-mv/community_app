import 'package:flutter/material.dart';
import 'categories/fruits_vegetables.dart';
import 'categories/dairy_eggs.dart';
import 'categories/bakery_bread.dart';
import 'categories/meat_seafood.dart';
import 'categories/beverages.dart';
import 'categories/snacks.dart';
import 'categories/pantry_staples.dart';
import 'categories/frozen_foods.dart';
import 'categories/household_supplies.dart';
import 'categories/health_beauty.dart';
import 'categories/baby_products.dart';
import 'categories/pet_supplies.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grocery Store',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color(0xFF101935), // AppBar background color
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      home: GroceryPage(),
    );
  }
}

class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Grocery Store"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          CategoryCard('Fruits & Vegetables', FruitsVegetablesPage()),
          CategoryCard('Dairy & Eggs', DairyEggsPage()),
          CategoryCard('Bakery & Bread', BakeryBreadPage()),
          CategoryCard('Meat & Seafood', MeatSeafoodPage()),
          CategoryCard('Beverages', BeveragesPage()),
          CategoryCard('Snacks', SnacksPage()),
          CategoryCard('Pantry Staples', PantryStaplesPage()),
          CategoryCard('Frozen Foods', FrozenFoodsPage()),
          CategoryCard('Household Supplies', HouseholdSuppliesPage()),
          CategoryCard('Health & Beauty', HealthBeautyPage()),
          CategoryCard('Baby Products', BabyProductsPage()),
          CategoryCard('Pet Supplies', PetSuppliesPage()),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;
  final Widget categoryPage;
  
  const CategoryCard(this.categoryName, this.categoryPage, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      color: Colors.blueGrey,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => categoryPage),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category, size: 50, color: Colors.white),
            SizedBox(height: 10),
            Text(
              categoryName,
              style: TextStyle(fontSize: 18, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
