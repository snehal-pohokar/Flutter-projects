import 'package:flutter/material.dart';

class ProfileDetailPage extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final String email;
  final String userId;

  const ProfileDetailPage({
    Key? key,
    required this.profileImageUrl,
    required this.name,
    required this.email,
    required this.userId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Details'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: profileImageUrl.isNotEmpty
                  ? NetworkImage(profileImageUrl)
                  : const AssetImage('assets/avtarimage.jpg') as ImageProvider,
            ),
            const SizedBox(height: 20),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              'User ID: $userId',
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
