import 'package:flutter/material.dart';

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
        appBar: AppBar(
          title: const Text('My Community', style: TextStyle(color: Color(0xFFFFFFFF)),),
          centerTitle: true,
          backgroundColor: Color(0xFF101935),
        ),
        body: CommunityMessages(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            
          },
          backgroundColor: Color(0xFF279AF1),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class CommunityMessages extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {
      'name': 'User 1',
      'unit': 'Unit a',
      'title': 'Message 1',
      'message': 'Description',
      'images': [
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
      ],
    },
    {
      'name': 'User 2',
      'unit': 'Unit b',
      'title': 'Message 2',
      'message': 'Description',
      'images': [
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
        'https://via.placeholder.com/150',
      ],
    },
    {
      'name': 'User 3',
      'unit': 'Unit c',
      'title': 'Message 3',
      'message': 'Description',
      'images': [],
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

class MessageCard extends StatelessWidget {
  final Map<String, dynamic> message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: const Color(0xFFF2FDFF),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  message['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  message['unit'],
                  style: const TextStyle(color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              message['title'],
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF279AF1),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              message['message'],
              style: const TextStyle(fontSize: 14),
            ),
            if (message['images'].isNotEmpty) ...[
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount:
                    message['images'].length > 5 ? 5 : message['images'].length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      message['images'][index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ],
          ],
        ),
      ),
    );
  }
}
