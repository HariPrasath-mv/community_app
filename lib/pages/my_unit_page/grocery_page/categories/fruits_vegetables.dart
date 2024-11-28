import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart';

class FruitsVegetablesPage extends StatelessWidget {
  final List<Map<String, dynamic>> items = [
    {
      'image':
          'assets/images/grocery/catagory_images/fruits_and_vegetables/onion.png',
      'name': 'Onion - Organically Grown',
      'price': 890,
      'unitOptions': ['10 Kg']
    },
    {
      'image':
          'assets/images/grocery/catagory_images/fruits_and_vegetables/banana.png',
      'name': 'Banana',
      'price': 180,
      'unitOptions': ['5 Kg', '10 Kg']
    },
    {
      'image':
          'assets/images/grocery/catagory_images/fruits_and_vegetables/tomato.png',
      'name': 'Tomato - Fresh',
      'price': 450,
      'unitOptions': ['5 Kg', '10 Kg']
    },
    {
      'image':
          'assets/images/grocery/catagory_images/fruits_and_vegetables/potato.png',
      'name': 'Potato - Farm Fresh',
      'price': 300,
      'unitOptions': ['5 Kg', '10 Kg']
    },
  ];

  final List<Map<String, dynamic>> cart = [];

  FruitsVegetablesPage({super.key});

  void addToCart(Map<String, dynamic> item) {
    cart.add(item);
    print('Item added to cart: $item');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      appBar: AppBar(
        title: const Text('Fruits & Vegetables'),
        backgroundColor: AppColors.appbarColor1,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to cart page or show cart items
            },
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two cards per row
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.52, // Adjusted for taller cards
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ItemCard(
            item: items[index],
            onAddToCart: addToCart,
          );
        },
      ),
    );
  }
}

class ItemCard extends StatefulWidget {
  final Map<String, dynamic> item;
  final Function(Map<String, dynamic>) onAddToCart;

  const ItemCard({super.key, required this.item, required this.onAddToCart});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  int _quantity = 1;
  String _selectedUnit = '';

  @override
  void initState() {
    super.initState();
    _selectedUnit = widget.item['unitOptions'][0];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                widget.item['image'],
                fit: BoxFit.cover,
                height: 100, // Adjusted for better proportionality
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 8),

            // Product Category
            Text(
              "Organic Fruits",
              style: TextStyle(
                fontSize: 12,
                color: Colors.green.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),

            // Product Name
            Text(
              widget.item['name'],
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 5),

            // Price and Rating Section
            Row(
              children: [
                Text(
                  '₹${widget.item['price']}', // Changed '$' to '₹' for INR
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.appbariconColor1,
                  ),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.green.shade100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: const [
                      Text(
                        '4.0',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        size: 12,
                        color: Colors.green,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 4),
                const Text(
                  '(1)',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Unit Options Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widget.item['unitOptions']
                  .map<Widget>(
                    (unit) => ChoiceChip(
                      label: Text(unit, style: const TextStyle(fontSize: 10)),
                      selected: _selectedUnit == unit,
                      onSelected: (selected) {
                        setState(() {
                          _selectedUnit = unit;
                        });
                      },
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 10),

            // Quantity Selector with Remove/Increase Buttons
            Row(
              children: [
                IconButton(
                  iconSize: 18,
                  onPressed: () {
                    if (_quantity > 1) {
                      setState(() {
                        _quantity--;
                      });
                    }
                  },
                  icon: const Icon(Icons.remove_circle_outline),
                ),
                Text(
                  'Qty $_quantity',
                  style: const TextStyle(fontSize: 12),
                ),
                IconButton(
                  iconSize: 18,
                  onPressed: () {
                    setState(() {
                      _quantity++;
                    });
                  },
                  icon: const Icon(Icons.add_circle_outline),
                ),
              ],
            ),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  widget.onAddToCart({
                    'name': widget.item['name'],
                    'price': widget.item['price'] * _quantity,
                    'quantity': _quantity,
                    'image': widget.item['image'],
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.btnColor1,
                ),
                icon: const Icon(Icons.shopping_cart, size: 16, color: AppColors.appbariconColor3,),
                label: const Text('ADD TO CART', style: TextStyle(color: AppColors.fontColor1)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
