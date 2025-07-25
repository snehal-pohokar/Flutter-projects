import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/DoctorSideUI.dart/OptionsPage1.dart';
import 'package:healthcare_app/EditProfilePage.dart';
import 'package:healthcare_app/OptionsPage.dart';
import 'package:healthcare_app/SplashScreen.dart';
import 'package:healthcare_app/navbar_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:"AIzaSyCt6iWQQ0hJQ-IW0P-4yEkRvCmRfcXyi54",
      appId: "1:1058903879808:android:b991a80be509d636f23665",
      messagingSenderId: "1058903879808",
      projectId: "healthcare-app-5158f",

    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) { 
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        
         home: const SplashScreen(), 
    //home: const DoctorsOptionsPage(), 
    );
  }
}

