import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_app/SignInPage.dart';
import 'package:healthcare_app/navbar_screen.dart';
import 'SignUpPageUI.dart';

class about extends StatefulWidget{

  const about({super.key});

  
  @override
  State<StatefulWidget> createState() => _SignUpPageState();  
}

class _SignUpPageState extends State{

  @override
  Widget build(BuildContext context){

    return Scaffold(
       appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0), // Adjust the height if needed
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.purple, Colors.blue], // Define your gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            title: const Text("About",
            style: TextStyle(
              color: Colors.white,
            ),
            
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent, // Make the AppBar background transparent
            elevation: 0, // Remove the shadow if you want a flat look
            leading: IconButton(
              onPressed: () {
                Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavbarScreen()),
                );
              },
              icon: const Icon(Icons.arrow_back,
              color: Colors.white,
              ),
            ),
           
          ),
        ),
      ),
     backgroundColor:const Color.fromARGB(255, 227, 241, 241),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Container(
           
            child:  const Text("A great thank you to Shashi Bagal Sir, Akshay Sir, Prajwal sir and the entire core2web team for their mentorship, guidance and unwavering support .Your guidance has been invaluable in our journey of flutter .For entrusting me with this opportunity and for their inspiring leadership. Additionally I would like to express my heartfelt gratitude to Ankita di and Dhanashri di for their invaluable guidance in our project",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400
            )
            ),
           
                  
                  ),
        ),
        
    ),
    );
  }
}