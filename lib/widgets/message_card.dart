import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart';
// import 'package:flutter_project_1/widgets/colors.dart';

class MessageCard extends StatelessWidget {
  final Map<String, dynamic> message;

  const MessageCard({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      elevation: 15,
      color: AppColors.backgroundColor1,
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
                  style: const TextStyle(
                      color: AppColors.fontColor3, fontSize: 10),
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
                    borderRadius: BorderRadius.circular(10),
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
                    Icon(Icons.thumb_up, color: const Color(0xFF004395)),
                    const SizedBox(width: 4),
                    Text('${message['likes']} Likes'),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.comment_outlined, color:Color(0xFF004395)),
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
