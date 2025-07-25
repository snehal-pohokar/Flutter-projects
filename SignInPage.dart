import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_app/navbar_screen.dart';
import 'SignUpPageUI.dart'; 


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _showCustomSnackbar({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> _signIn() async {
    if (_emailController.text.trim().isEmpty || _passwordController.text.trim().isEmpty) {
      _showCustomSnackbar(message: 'Please fill in all fields');
      return;
    }

    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      log('User signed in: ${userCredential.user!.email}');
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const NavbarScreen(),
        ),
      );
    } on FirebaseAuthException catch (error) {
      log('Sign-in error: ${error.code}');
      _showCustomSnackbar(message: error.message ?? 'Sign-in failed.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 227, 241, 241),
      
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
              "Sign-In",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Align(
                alignment: Alignment.center,
                 child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset("assets/Vector.png"),
                               ),
               ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Enter your email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                  
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Enter your password',
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
                obscureText: !_isPasswordVisible,
              ),

              SizedBox(height: 5,),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    _showCustomSnackbar(message: 'Forgot password is not implemented yet.');
                  },
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: GestureDetector(
                  onTap: _signIn,
                  child: Container(
                    width: 250,
                    height: 56,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      gradient: const LinearGradient(
              colors: [
                Colors.purple, // Start color (purple)
                Colors.blue, // End color (blue)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
                     // color: Colors.purple,
                    ),
                    child: Center(
                      child: Text(
                        " Login",
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
              ),
              const SizedBox(height: 12),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPageUI(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("OR"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 16),
              
               Center(
                 child: Row(
                           children: [
                           const SizedBox(width: 115,),
                           Container(
                            height: 50,
                            width: 50,
                             decoration: BoxDecoration(
                 
                               borderRadius: BorderRadius.circular(20),
                                
                               ),
                             child: Image.asset("assets/f3.png",height: 100,width: 100,),
                             ),
                            const SizedBox(width: 30,),
                 
                             Container(
                            height: 50,
                            width: 50,
                             decoration: BoxDecoration(
                 
                               borderRadius: BorderRadius.circular(20),
                                
                               ),
                             child: Image.asset("assets/mail.jpg",height: 40,width: 40,),
                             ),
                 
                            const SizedBox(width: 20,),
                          ],
                         ),
               ),
                       
             ],  ),
            
          ),
        ),
      );
    
  }
}