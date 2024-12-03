import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart';
import 'package:flutter_project_1/widgets/quick_access.dart';
// import 'package:flutter_project_1/widgets/colors.dart';

// DuesOption Widget with built-in parameters and logic
class DuesOption extends StatelessWidget {
  const DuesOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.color5,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: Offset(4.0, 4.0),
            blurRadius: 10,
            spreadRadius: 1.0,
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 10,
            spreadRadius: 1.0,
          )
        ],
      ),
      padding: const EdgeInsets.all(14),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.color1,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.account_balance_wallet,
              color: AppColors.color3,
              size: 36,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Dues',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '₹ 65.00',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFFFF0000),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 150,
          ),
          QuickAccessButton()
        ],
      ),
    );
  }
}
