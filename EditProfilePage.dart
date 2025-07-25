import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatefulWidget {
  final String userId;

  const EditProfilePage({super.key, required this.userId});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? _profileImageUrl;

  bool _isModified = false;

  /// Load profile data from Firestore
  Future<void> _loadProfileData() async {
    try {
      final docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data();
        if (data != null) {
          _nameController.text = data['name'];
          _emailController.text = data['email'];
          _phoneController.text = data['phone'];
          _addressController.text = data['address'];
          _profileImageUrl = data['profileImageUrl'];
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading profile: $e')),
      );
    }
  }

  /// Save updated profile data to Firestore
  Future<void> _saveProfileData() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .update({
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'address': _addressController.text,
        'profileImageUrl': _profileImageUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile updated successfully!')),
      );
      Navigator.pop(context); // Return to the previous page
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving profile: $e')),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadProfileData();
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
                Colors.purple, // Start color (purple)
                Colors.blue, // End color (blue)
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
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Edit Profile",
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white, // White text for contrast
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: _profileImageUrl != null
                      ? NetworkImage(_profileImageUrl!)
                      : null,
                  child: _profileImageUrl == null
                      ? const Icon(Icons.camera_alt, size: 40)
                      : null,
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(
                controller: _nameController,
                labelText: 'Full Name',
              ),
              _buildTextField(
                controller: _emailController,
                labelText: 'Email',
              ),
              _buildTextField(
                controller: _phoneController,
                labelText: 'Phone',
              ),
              _buildTextField(
                controller: _addressController,
                labelText: 'Address',
              ),
              const SizedBox(height: 20),
              GestureDetector(
                  onTap: (){
                    _isModified ? _saveProfileData : null;
                  },
                  child: Container(
                        width: 250,
                        height: 56,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(
                            color: _isModified ?const Color.fromRGBO(250, 232, 232, 1) : Colors.grey,
                            width: 2,
                          ),
                          gradient: LinearGradient(colors: [
                            Colors.purple,
                            Colors.blue,
                          ])
                        ),
                        child: Center(
                          child: Text("Save",
                          style: GoogleFonts.inter(
                           fontWeight: FontWeight.w600,
                            fontSize: 16, 
                            color: Colors.white,                        
                          ),
                          textAlign: TextAlign.center,
                          
                          ),
                        ),
                      ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: const OutlineInputBorder(),
        ),
        onChanged: (_) {
          setState(() {
            _isModified = true;
          });
        },
      ),
    );
  }
}