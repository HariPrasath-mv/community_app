import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_project_1/widgets/colors.dart';
import 'package:intl/intl.dart';
import 'account_transfer_page.dart';
import 'upi_payment_page.dart';
import 'wallet_payment_page.dart';

class BillPaymentPage extends StatefulWidget {
  const BillPaymentPage({super.key});

  @override
  _BillPaymentPageState createState() => _BillPaymentPageState();
}

class _BillPaymentPageState extends State<BillPaymentPage> {
  final Map<String, double> sampleValues = {
    'Electricity': 100.0,
    'Water': 50.0,
    'Internet': 50.0,
    'Phone': 30.0,
    'Cable TV': 45.0,
  };

  // Method to calculate the total balance
  double get totalBalance => sampleValues.values.reduce((a, b) => a + b);

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter =
        NumberFormat.currency(locale: 'en_IN', symbol: '₹');

    return Scaffold(
      backgroundColor: AppColors.backgroundColor1,
      appBar: AppBar(
        backgroundColor: AppColors.appbarColor1,
        iconTheme: const IconThemeData(
          color: AppColors.appbariconColor2,
        ),
        title: const Text('Bill Payments', style: TextStyle(color: AppColors.fontColor2)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16.0),
            Column(
              children: sampleValues.entries.map((entry) {
                return BillCategoryTile(
                  label: entry.key,
                  amount: entry.value,
                  formatter: formatter,
                );
              }).toList(),
            ),
            const SizedBox(height: 32.0),
            Text(
              'Total Payment Balance: ${formatter.format(totalBalance)}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32.0),
            const Text(
              'Payment Methods',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 3, // Changed to 3 columns
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  PaymentMethodTile(
                    svgPath: 'assets/icons/payments/upi.svg',
                    label: 'UPI',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UpiPaymentPage(totalAmount: totalBalance),
                        ),
                      );
                    },
                  ),
                  PaymentMethodTile(
                    svgPath: 'assets/icons/payments/wallet.svg',
                    label: 'Wallet',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              WalletPaymentPage(totalAmount: totalBalance),
                        ),
                      );
                    },
                  ),
                  PaymentMethodTile(
                    svgPath: 'assets/icons/payments/account_transfer.svg',
                    label: 'Card Payment',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AccountTransferPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BillCategoryTile extends StatelessWidget {
  final String label;
  final double amount;
  final NumberFormat formatter;

  const BillCategoryTile({
    super.key,
    required this.label,
    required this.amount,
    required this.formatter,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: Text(formatter.format(amount)),
    );
  }
}

class PaymentMethodTile extends StatelessWidget {
  final String svgPath;
  final String label;
  final VoidCallback onTap;

  const PaymentMethodTile({
    super.key,
    required this.svgPath,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            svgPath,
            width: 60,
            height: 60,
          ),
          const SizedBox(height: 8.0),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
