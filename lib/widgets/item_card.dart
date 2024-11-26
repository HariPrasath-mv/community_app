import 'package:flutter/material.dart';

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
      child: SizedBox(
        height: 320, // Increased card height
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Section
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      widget.item['image'],
                      fit: BoxFit.cover,
                      height: 140, // Increased image height
                      width: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: IconButton(
                      icon: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                        size: 20,
                      ),
                      onPressed: () {
                        // Action for eye button
                      },
                    ),
                  ),
                ],
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
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),

              // Product Name
              Text(
                widget.item['name'],
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),

              // Price and Rating Section
              Row(
                children: [
                  Text(
                    '₹${widget.item['price']}',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
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

              // Quantity Selector Section
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
              const SizedBox(height: 10),

              // Add to Cart Button (Moved Below)
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10), // Adjusted button size
                    backgroundColor: Colors.orange,
                    textStyle: const TextStyle(fontSize: 12),
                  ),
                  icon: const Icon(Icons.shopping_cart, size: 16),
                  label: const Text('ADD TO CART'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
