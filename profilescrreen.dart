import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_app/About.dart';
import 'package:healthcare_app/admin&user.dart';
import 'package:healthcare_app/cartPage.dart';
import 'package:healthcare_app/navbar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'EditProfilePage.dart';
import 'OptionsPage.dart';
import 'ReportPage.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<Map<String, dynamic>> fetchProfileData() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? profileImageUrl = prefs.getString('profileImageUrl');
      final String? name = prefs.getString('name');
      final String? email = prefs.getString('email');
      final String? userId = prefs.getString('userId');

      return {
        'profileImageUrl': profileImageUrl ?? '',
        'name': name ?? 'Pooja',
        'email': email ?? 'Poo@gmail.com',
        'userId': userId ?? 'userId',
      };
    } catch (e) {
      throw Exception('Error fetching profile data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF8E44AD), // Start color (purple)
                Color(0xFF3498DB), // End color (blue)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent, // Transparent for gradient
            elevation: 0, // Flat look
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavbarScreen()),
                );
              },
            ),
            title: Text(
              "Profile",
              style: GoogleFonts.poppins(
              
                color: Colors.white, // White text for contrast
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchProfileData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }

          final profileData = snapshot.data ?? {};
          final String profileImageUrl = profileData['profileImageUrl'] ?? '';
          final String name = profileData['name'] ?? 'Pooja';
          final String email = profileData['email'] ?? 'Poo@gmail.com';
          final String userId = profileData['userId'] ?? 'userId';

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              _buildProfileHeader(context, profileImageUrl, name, email, userId),
              const SizedBox(height: 20),
              _buildProfileOption(context, 'Edit Profile', const EditProfilePage(userId: 'userId')),
              _buildProfileOption(context, 'Report', const HealthDashboard()),
              _buildProfileOption(context, 'About us',about() ),
              _buildProfileOption(context, 'Orders', CartPage()),
              _buildProfileOption(context, 'Payment and HealthCash', null),
              _buildProfileOption(context, 'Read about Health', null),
              _buildProfileOption(context, 'Help Center', null),
              _buildLogoutOption(context, 'Logout', const Optionspage()),
            ],
          );
        },
      ),
    );
  }

  Widget _buildProfileHeader(BuildContext context, String profileImageUrl, String name, String email, String userId) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfileDetailPage(
              profileImageUrl: profileImageUrl,
              name: name,
              email: email,
              userId: userId, 
              phone: 'phone', 
              address: 'address',
               
              
            ),
          ),
        );
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: profileImageUrl.isNotEmpty
                ? NetworkImage(profileImageUrl)
                : const AssetImage('assets/avtarimage.jpg') as ImageProvider,
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                email,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProfileOption(BuildContext context, String title, Widget? screen) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        if (screen != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('$title is not available yet')),
          );
        }
      },
    );
  }

  Widget _buildLogoutOption(BuildContext context, String title, Widget screen) {
    return ListTile(
      title: const Text('Logout'),
      trailing: const Icon(Icons.logout),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Logout'),
              content: const Text('Are you sure you want to log out?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.clear(); // Clear all stored data on logout
                    //Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const AdminUser(),
                      ),
                    );
                  },
                  child: const Text('Logout'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class ProfileDetailPage extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final String email;
  final String phone;
  final String address ;
  final String userId;

  const ProfileDetailPage({
    super.key,
    required this.profileImageUrl,
    required this.name,
    required this.email,
    required this.userId, 
    required this.phone, 
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Details'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:Center(
          child: Column(
          children: [
            CircleAvatar(

              radius: 60,
              backgroundImage: profileImageUrl.isNotEmpty
                  ? NetworkImage(profileImageUrl)
                  : const AssetImage('assets/avtarimage.jpg') as ImageProvider,
            ),
            const SizedBox(height: 40),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Text(
              phone,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              address,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        ),
         
      ),
    );
  }
}
