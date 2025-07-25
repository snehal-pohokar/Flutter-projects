import 'package:flutter/material.dart';
import 'package:healthcare_app/DoctorSideUI.dart/OptionsPage1.dart';
import 'package:healthcare_app/OptionsPage.dart';


class AdminUser extends StatefulWidget {
  const AdminUser({super.key});

  @override
  State<AdminUser> createState() => _AdminUserState();
}

class _AdminUserState extends State<AdminUser> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: AppBar(
              centerTitle: true,
              title: const Text("Welcome !!"),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ),
        body: Center(
            
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                height: 50,
                // width: 150,
                child: Center(
                  child: Expanded(
                    child: const Text(
                      "It's MaxCare Time",
                      style: TextStyle(
                       color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 25,
                      ),
                    
                    ),
                  ),
                ),
              ),Container(
                height: 50,
                // width: 150,
                child: Center(
                  child: Expanded(
                    child: const Text(
                      "Your Health in Your Hand",
                      style: TextStyle(
                       color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 28,
                      ),
                    
                    ),
                  ),
                ),
              ),
              SizedBox(height: 17,),
              Image.asset(
                "assets/Vector (1).png",
               
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {

                          Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DoctorsOptionsPage(),
                          ),
                        );
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.purple],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person, color: Colors.white),
                          SizedBox(height: 10),
                          Text(
                            "Doctor",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Optionspage()
                        ),
                      );
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Colors.blue, Colors.purple],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person_outline, color: Colors.white),
                          SizedBox(height: 10),
                          Text(
                            "Patient",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}