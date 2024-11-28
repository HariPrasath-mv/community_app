import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart';

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
          elevation: 4,
          centerTitle: true,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'My Community',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.fontColor2,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Action for notifications
              },
              icon: const Icon(Icons.notifications_none, color: AppColors.fontColor2),
            ),
            IconButton(
              onPressed: () {
                // Action for search
              },
              icon: const Icon(Icons.search, color: AppColors.fontColor2),
            ),
          ],
        ),
        body: CommunityMessages(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Action for FAB
          },
          backgroundColor: const Color(0xFF279AF1),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class CommunityMessages extends StatelessWidget {
  final List<Map<String, dynamic>> messages = [
    {
      'profileImage': 'https://fps.cdnpk.net/images/ai/image-generator/gallery/resource-tti-12.webp',
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

class MessageCard extends StatelessWidget {
  final Map<String, dynamic> message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Sender Information
            Row(
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    message['profileImage'] ??
                        'https://via.placeholder.com/150', // Default image
                  ),
                ),
                const SizedBox(width: 10),
                // Name and Unit
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                // Timestamp
                Text(
                  message['timestamp'] ?? '',
                  style: const TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Title
            Text(
              message['title'],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            // Message Description
            Text(
              message['message'],
              style: const TextStyle(fontSize: 14),
            ),
            if (message['images'].isNotEmpty) ...[
              const SizedBox(height: 12),
              // Image Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount:
                    message['images'].length > 3 ? 3 : message['images'].length,
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
            const SizedBox(height: 12),
            // Footer with Like and Comment
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.thumb_up_alt_outlined, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text('${message['likes']} Likes'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.comment_outlined, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text('${message['comments']} Comments'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
