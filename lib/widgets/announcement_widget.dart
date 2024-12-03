import 'package:flutter/material.dart';
import 'package:flutter_project_1/widgets/colors.dart'; // Assuming AppColors is defined here

class AnnouncementWidget extends StatelessWidget {
  final List<Map<String, String>> announcements;

  const AnnouncementWidget({super.key, required this.announcements});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Announcements',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to announcements page
                },
                child: const Text('View All',
                    style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: announcements.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  margin: const EdgeInsets.only(right: 16, bottom: 10),
                  child: _buildAnnouncementCard(
                    announcements[index]['title']!,
                    announcements[index]['description']!,
                    announcements[index]['date']!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementCard(String title, String description, String date) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor1,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(4.0, 4.0),
            blurRadius: 15,
            spreadRadius: 1.0,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4.0, -4.0),
            blurRadius: 15,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Card(
        color: AppColors.backgroundColor1,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(title),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey),
        ),
      ),
    );
  }
}
