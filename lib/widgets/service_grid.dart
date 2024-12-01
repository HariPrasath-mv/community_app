// ignore_for_file: use_super_parameters
import 'package:flutter/material.dart';
import 'service_option.dart';

class ServiceGrid extends StatelessWidget {
  final List<Map<String, dynamic>> options;

  const ServiceGrid({Key? key, required this.options}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Reduce the number of items per row if needed
          crossAxisSpacing: 20, // Increase horizontal spacing
          mainAxisSpacing: 30, // Increase vertical spacing
        ),
        itemCount: options.length,
        itemBuilder: (context, index) {
          final option = options[index];
          return ServiceOption(
            title: option["title"],
            iconPath: option["icon"],
          );
        },
      ),
    );
  }
}
