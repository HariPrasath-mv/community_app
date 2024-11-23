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

class GroceryPage extends StatelessWidget {
  const GroceryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Grocery Categories',
          style: TextStyle(color: Color(0xFFFFFFFF)),
        ),
        backgroundColor: const Color(0xFF101935),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        children: [
          _buildCategoryCard(
            context,
            'Fruits & Vegetables',
            const FruitsVegetablesPage(),
          ),
          _buildCategoryCard(
            context,
            'Dairy & Eggs',
            const DairyEggsPage(),
          ),
          _buildCategoryCard(
            context,
            'Bakery & Bread',
            const BakeryBreadPage(),
          ),
          _buildCategoryCard(
            context,
            'Meat & Seafood',
            const MeatSeafoodPage(),
          ),
          _buildCategoryCard(
            context,
            'Beverages',
            const BeveragesPage(),
          ),
          _buildCategoryCard(
            context,
            'Snacks',
            const SnacksPage(),
          ),
          _buildCategoryCard(
            context,
            'Pantry Staples',
            const PantryStaplesPage(),
          ),
          _buildCategoryCard(
            context,
            'Frozen Foods',
            const FrozenFoodsPage(),
          ),
          _buildCategoryCard(
            context,
            'Household Supplies',
            const HouseholdSuppliesPage(),
          ),
          _buildCategoryCard(
            context,
            'Health & Beauty',
            const HealthBeautyPage(),
          ),
          _buildCategoryCard(
            context,
            'Baby Products',
            const BabyProductsPage(),
          ),
          _buildCategoryCard(
            context,
            'Pet Supplies',
            const PetSuppliesPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
            // borderRadius: BorderRadius.circular(18.0),
            ),
        color: const Color(0xFF101935),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(2.1),
                  child: Image.asset(
                    'assets/images/$title.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
