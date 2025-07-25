// import 'package:flutter/material.dart';
// import 'package:healthcare_app/homescreen.dart';
// import 'package:healthcare_app/main.dart';
// import 'package:healthcare_app/pharmacy.dart';
// import 'package:healthcare_app/profilescrreen.dart';

// class NavbarScreen extends StatefulWidget {
//   const NavbarScreen({super.key});

//   @override
//   State<NavbarScreen> createState() => _NavbarScreenState();
// }

// class _NavbarScreenState extends State<NavbarScreen> {
//   int _selectedIndex=0;

//   List screenList=[
    
//     const Homescreen(email: '',),
//     const Homescreen(email: '',),
//     ProductGridPage(),
//     ProfileScreen()
    
    
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screenList.elementAt(_selectedIndex),
//        bottomNavigationBar: BottomNavigationBar(
//           currentIndex: _selectedIndex,
//            onTap: (index) {
//             setState(() {
//               _selectedIndex = index;
//             });
//           },
         
//           type: BottomNavigationBarType.fixed,
//           backgroundColor: Colors.white,
//           selectedItemColor: Colors.teal,
//           unselectedItemColor: Colors.grey,
         
//           items: [
//             BottomNavigationBarItem(
//               icon: GestureDetector(
//                 onTap: () {
                 
//                 },
//                 child: const Icon(Icons.home),
//               ),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: GestureDetector(
//                 onTap: () {
                 
//                 },
//                 child: const Icon(Icons.notifications_active),
//               ),
//               label: 'Notifications',
//             ),
//             BottomNavigationBarItem(
//               icon: GestureDetector(
//                 onTap: () {
                 
//                 },
//                 child: const Icon(Icons.local_pharmacy),
//               ),
//               label: 'Pharma',
//             ),
//             BottomNavigationBarItem(
//               icon: GestureDetector(
//                 onTap: () {
                 
//                 },
//                 child: const Icon(
//                   Icons.person,
//                 ),
//               ),
//               label: 'Profile',
//             ),
//           ],
//         )
//       );
 
    
//   }
// }



import 'package:flutter/material.dart';
import 'package:healthcare_app/NotificationPage.dart';
import 'package:healthcare_app/ProfilePage.dart';
import 'package:healthcare_app/homescreen.dart';
import 'package:healthcare_app/main.dart';
import 'package:healthcare_app/pharmacy.dart';
import 'package:healthcare_app/profilescrreen.dart';

class NavbarScreen extends StatefulWidget {
  const NavbarScreen({super.key});

  @override
  State<NavbarScreen> createState() => _NavbarScreenState();
}

class _NavbarScreenState extends State<NavbarScreen> {
  int _selectedIndex = 0;

  List screenList = [
    const Homescreen(email: ''),
    const NotificationPage(),
    const ProductGridPage(),
    const ProfileScreen(),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_active),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pharmacy),
            label: 'Pharma',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
    //const NavbarScreen();
  }
}
