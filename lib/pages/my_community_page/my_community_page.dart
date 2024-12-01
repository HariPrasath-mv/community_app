import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart';
import 'package:flutter_project_1/widgets/message_card.dart';

void main() {
  runApp(MyCommunityPage());
}

class MyCommunityPage extends StatelessWidget {
  const MyCommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: AppColors.backgroundColor1,
        appBar: AppBar(
          backgroundColor: AppColors.appbarColor1,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'My Community',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: CommunityMessages(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Action for FAB
          },
          backgroundColor: const Color(0xFF004395),
          child: const Icon(
            Icons.add,
            color: AppColors.appbariconColor3,
          ),
        ),
      ),
    );
  }
}

class CommunityMessages extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {
      'profileImage':
          'https://fps.cdnpk.net/images/ai/image-generator/gallery/resource-tti-12.webp',
      'name': 'User007',
      'unit': 'Owner, B501',
      'timestamp': '22 May 2050, 10:30 PM',
      'title': 'Welcome to our Community',
      'message': 'This is your first Community Message',
      'images': [
        'https://fps.cdnpk.net/images/ai/image-generator/gallery/resource-tti-15.webp',
        'https://fps.cdnpk.net/images/ai/image-generator/gallery/magnific-cat.webp',
        'https://fps.cdnpk.net/images/ai/image-generator/gallery/magnific-robot.webp',
      ],
      'likes': 0,
      'comments': 0,
    },
  ];

  CommunityMessages({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return MessageCard(message: messages[index]);
      },
    );
  }
}
