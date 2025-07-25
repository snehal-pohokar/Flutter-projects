import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_app/navbar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final String _defaultAvatarUrl =
      'https://static.vecteezy.com/system/resources/previews/014/194/216/non_2x/avatar-icon-human-a-person-s-badge-social-media-profile-symbol-the-symbol-of-a-person-vector.jpg';

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  Future<void> _loadProfile() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _nameController.text = prefs.getString('name') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _phoneController.text = prefs.getString('phone') ?? '';
      _addressController.text = prefs.getString('address') ?? '';
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
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
                Navigator.pop(context);
              },
            ),
            title: Text(
              "Profile Page",
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
                onTap: () {},
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(_defaultAvatarUrl),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(_nameController, "Full Name", Icons.person),
              const SizedBox(height: 16),
              _buildTextField(_emailController, "Email", Icons.email),
              const SizedBox(height: 16),
              _buildTextField(_phoneController, "Phone Number", Icons.phone),
              const SizedBox(height: 16),
              _buildTextField(_addressController, "Address", Icons.home),
              const SizedBox(height: 30),
              
                 Container(decoration: const BoxDecoration(
                      gradient: const LinearGradient(
              colors: [
                Colors.purple, // Start color (purple)
                Colors.blue, // End color (blue)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),),
                child: ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                
                    if (_nameController.text.isEmpty ||
                        _emailController.text.isEmpty ||
                        _phoneController.text.isEmpty ||
                        _addressController.text.isEmpty) {
                      _showSnackBar('Please fill all the fields');
                      return;
                    }
                
                    await prefs.setString('name', _nameController.text.trim());
                    await prefs.setString('email', _emailController.text.trim());
                    await prefs.setString('phone', _phoneController.text.trim());
                    await prefs.setString(
                        'address', _addressController.text.trim());
                
                    _showSnackBar('Profile saved successfully!');
                
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NavbarScreen()),
                    );
                  },
                  style:
                   ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent
                    ,shadowColor: Colors.transparent,
                   
                  
                    padding: const EdgeInsets.symmetric(
                      horizontal: 80,
                      vertical: 15,
                    ),
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,
                    color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String labelText, IconData icon) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: labelText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
