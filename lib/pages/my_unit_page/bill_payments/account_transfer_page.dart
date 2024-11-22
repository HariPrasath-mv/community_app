import 'package:flutter/material.dart';

class AccountTransferPage extends StatelessWidget {
  const AccountTransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Transfer', style: TextStyle(color: Color(0xFFFFFFFF))),
        backgroundColor: const Color(0xFF101935),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: const Center(
        child: Text(
          'Account Transfer Page',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
