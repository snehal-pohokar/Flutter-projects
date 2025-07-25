// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//     _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Navigate to HomeScreen after 3 seconds
//     Timer(const Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (context) => NavbarScreen(),
//         ),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context){
//     return Scaffold(

      
//       backgroundColor:const Color.fromARGB(255, 147, 217, 210) ,// Set background color
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/Vector.png', width: 200, height: 200,color: const Color.fromARGB(255, 4, 65, 114),),
//                        const  SizedBox(height: 2),
//             // Optional: Text or animation for splash screen
//             const Text(
//             'Maxcare',
//             style: TextStyle(
//               fontFamily: "roboto", // Use your preferred font
//               fontSize: 45, // Adjust for the required size
//               fontWeight: FontWeight.bold,
//               color: Color.fromARGB(255, 7, 53, 91), // Choose a color
//               shadows: [
//                 Shadow(
//                   offset: Offset(3.0, 3.0), // Shadow position
//                   blurRadius: 4.0, // Shadow blur
//                   color: Colors.grey
                
//                 ),
//               ],
//               letterSpacing: 1.8, // Add spacing between letters
//             ),
//           ),
//                        const SizedBox( height: 10,),
            
//             //  const Text(
//             //   'Medical app',
//             //   selectionColor: Color.fromRGBO(33,51,89,100),
//             //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// class SecondScreen extends StatelessWidget {
//   const SecondScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/beautiful-young-female-doctor-looking-camera-office-removebg-preview 1.png',
//                   width: 296,
//                   height: 467,
//                 ),
//                 const SizedBox(height: 5),
//                 Container(
//                   height: 70,
//                   width: 270,
//                   child: const Text(
//                     "Find lot of specialist doctor in one place",
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 20,
//             right: 20,
//             child: CircleAvatar(
//              backgroundColor:  Colors.teal,
//               radius: 30,
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_forward_outlined, color: Colors.black),
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => SecondScreen()),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Second2Screen extends StatelessWidget {
  // const Second2Screen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   'assets/doctor-with-his-arms-crossed-white-background-removebg-preview 1.png',
//                   width: 300,
//                   height: 500,
//                 ),
//                 const SizedBox(height: 5),
//                 const SizedBox(
//                   height: 70,
//                   width: 270,
//                   child: Text(
//                     "Get advice only from a doctor you believe in",
//                     style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//               ],
//             ),
//           ),
//           Positioned(
//             bottom: 20,
//             right: 20,
//             child: CircleAvatar(
//                backgroundColor:  Colors.teal,
//               radius: 30,
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_forward_outlined, color: Colors.black),
//                 onPressed: () {
//                    Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const SignUpPage()),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



 // class Thirdscreen extends StatefulWidget {
 //   const Thirdscreen({super.key});

 //   @override
 //   State<Thirdscreen> createState() => _HealthcareUIState();
 // }

 // class _HealthcareUIState extends State<Thirdscreen> {
//   TextEditingController _searchController = TextEditingController();
//   int _currentIndex = 0;

//   Widget buildDoctorCard(String imagePath, String name) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//       borderRadius:BorderRadius.circular(30),
//       ),
//        child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         ClipOval(
//           child: GestureDetector(
//             child: Image.asset(
//               imagePath,
//               fit: BoxFit.cover,
//               height: 100, 
//               width: 100,
//             ),
//             //onTap: () => ,
//           ),
//         ),
//           const SizedBox(height: 8),
//           Center(
//             child: Text(
//               name,
              
//               style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
//             ),
//           ),
//         ]
//           ),
        
//       );
    
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: ElevatedButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => ProfileScreen()),
//           );
//         },
//         child:const CircleAvatar(
//           backgroundColor: Colors.amber,
//         )
//                 ),
//         title: Container(
//           height: 40, // Search bar height
//           decoration: BoxDecoration(
//           color: const Color.fromRGBO(206, 217, 237, 0.902),
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: TextField(
//             controller: _searchController,
//             decoration: const InputDecoration(
//               hintText: 'Search...',
//               border: InputBorder.none,
//               hintStyle: TextStyle(color: Colors.black87),
//               contentPadding: EdgeInsets.symmetric(horizontal: 10),
//             ),
//             style: const TextStyle(color: Colors.black54),
//           ),
//         ),
//         actions: [
          
//              IconButton(
//               icon: const
//                Icon(Icons.chat, color: Color(0xFFB29CE1)),
//                onPressed: () {
//                 print("Chat icon pressed");
               
//               },
//              ),
            
          
//         ],
//         backgroundColor: Colors.white,
//       ),
      
//       body: ListView(
//         children: [
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               "CHOOSE FROM TOP SPECIALISTS",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 buildDoctorCard("assets/gynocology.jpeg", "Gynocology"),
//                 buildDoctorCard("assets/mental1.jpg", "Mental Wellness"),
//                 buildDoctorCard("assets/general physician.jpeg", "General Physician"),
//                 buildDoctorCard("assets/dermitology.jpg", "Dermitology"),
               
//               ],
//             ),
//           ),


//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 buildDoctorCard("assets/Pediatric.jpeg", "Pediatric"),
//                 buildDoctorCard("assets/Orthopedic.jpeg", "Orthopedic"),
//                 buildDoctorCard("assets/sexiology.jpeg", "Sexiology"),
//                 buildDoctorCard("assets/diabitiology.jpeg", "Diabitiology"),
               
//               ],
//             ),
//           ),
          
//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               "Common Health Issue",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 buildDoctorCard("assets/stomach pain.jpeg", "Stomach pain"),
//                 buildDoctorCard("assets/Vertigo.jpeg", "Vertigo"),
//                 buildDoctorCard("assets/Acne.jpeg", "Acne"),
//                 buildDoctorCard("assets/PCOS.png", "PCOS"),
                
//               ],
//             ),
//           ),

//            SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               children: [
//                 buildDoctorCard("assets/back pain.jpeg", "Back Pain"),
//                 buildDoctorCard("assets/Thyroid.jpeg", "Thyroid"),
//                 buildDoctorCard("assets/hedaches.jpeg", "Headaches"),
//                 buildDoctorCard("assets/fungai.jpeg", "Fungai"),
                
//               ],
//             ),
//           ),

//           const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               "General Physician",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
           
//             child: Row(
//               children: [
//                 buildDoctorCard("assets/fever.jpeg", "Fever"),
//                 buildDoctorCard("assets/high blood pressure.jpeg", "Highblood pressure"),
//                 buildDoctorCard("assets/pneumonia.jpeg", "Pneumonia"),
//                 buildDoctorCard("assets/Diziness.jpeg", "Diziness"),
//               ],
//             ),
//           ),

//            const Padding(
//             padding: EdgeInsets.all(16.0),
//             child: Text(
//               "Orthopedist",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
//             ),
//           ),
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
           
//             child: Row(
//               children: [
//                 buildDoctorCard("assets/Knee pain.jpeg", "Knee pain"),
//                 buildDoctorCard("assets/hand pain.jpeg", "Hand pain"),
//                 buildDoctorCard("assets/Leg pain.jpeg", "Leg pain"),
//                 buildDoctorCard("assets/back pain.jpeg", "Back pain"),
//               ],
//             ),
//           ),
//         ],
//       ),

      

//       // bottomNavigationBar: BottomNavigationBar(
//       //   currentIndex: _currentIndex,
//       //   type: BottomNavigationBarType.fixed,
//       //   backgroundColor: Colors.teal,
//       //   selectedItemColor: Colors.black,
//       //   unselectedItemColor: Colors.white,
//       //   onTap: (index) {
//       //     setState(() {
//       //       _currentIndex = index;
//       //     });
//       //   },
//       //   items: const [
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.home),
//       //       label: 'Home',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.notifications_active),
//       //       label: 'Notifications',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.report),
//       //       label: 'Report',
//       //     ),
//       //     BottomNavigationBarItem(
//       //       icon: Icon(Icons.person),
//       //       label: 'Profile',
//       //     ),
//       //   ],
//       // ),
//   );
//   }
// }


// //ProfileScreen  page
// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//         backgroundColor: Colors.teal,
//       ),
//       body: ListView(
//         padding: const EdgeInsets.all(16),
//         children: [
//           buildProfileHeader(),
//           const SizedBox(height: 20),
//           buildProfileOption(context, 'Edit Profile'),
//           buildProfileOption(context, 'Appointments'),
//           buildProfileOption(context, 'Settings'),
//           buildProfileOption(context, 'Orders'),
//           buildProfileOption(context, 'Payment and healthcash'),
//           buildProfileOption(context, 'read about health'),
//           buildProfileOption(context, 'Help Center'),
//           buildProfileOption(context, 'Logout'),

//         ],
//       ),
//     );
//   }

//   Widget buildProfileHeader() {
//     return  const Center(
//       child:  Row(
//         children: [
//            CircleAvatar(
//             radius: 40,
//             backgroundImage: AssetImage(''
            
//             ),
//           ),
//            SizedBox(width: 20),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children:  [
//               Text(
//                 'John Doe',
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               Text(
//                 'johndoe@example.com',
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildProfileOption(BuildContext context, String title) {
//     return ListTile(
//       title: Text(title),
//       trailing: const Icon(Icons.arrow_forward),
//       onTap: () {
//          Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => EditProfileScreen()
//                         ),
//                       );
//    // Add navigation or functionality here
//       },
//     );
//   }
// }

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:healthcare_app/main.dart';
// import 'package:healthcare_app/productDetailPage.dart';


// class Pharmacy extends StatefulWidget {
//   const Pharmacy({super.key});

//   @override
//   State<Pharmacy> createState() => _Pharmacy();
// }

// class _Pharmacy extends State<Pharmacy> {
//   void navigateToProductDetail(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const ProductDetailPage(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//        backgroundColor:const Color.fromARGB(255, 147, 217, 210) ,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           "Pharmacy",
//           style: GoogleFonts.poppins(
//             fontSize: 18,
//             color: Colors.black,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.shopping_cart_rounded),
//             onPressed: () {},
//           ),
//         ],
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//              Navigator.pop(
//               context,
//               MaterialPageRoute(builder: (context) => const Thirdscreen()),
//             );
//           },
//         ),
//       ),
//       body: Padding(
  
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: ListView(
        
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   focusColor: Colors.teal,
//                   contentPadding: const EdgeInsets.symmetric(vertical: 10),
//                   prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                   hintText: "Search drugs, category...",
//                   hintStyle: GoogleFonts.poppins(fontSize: 14),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                     borderSide: const BorderSide(color: Colors.teal),
//                   ),
//                   fillColor: Color.fromARGB(255, 184, 219, 213),
//                 ),
//               ),
//             ),
//             const ImageCarousel(),  
//            const SizedBox(height: 10),
//             Container(
//               padding: const EdgeInsets.all(16),
//               decoration: BoxDecoration(
//                 color:const Color.fromRGBO(206, 217, 237, 0.902),
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Order quickly with Prescription",
//                           style: GoogleFonts.poppins(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                         const SizedBox(height: 10),
//                         ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.teal,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: Text(
//                             "Upload Prescription",
//                             style: GoogleFonts.poppins(
//                               fontSize: 12,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       navigateToProductDetail(context);
//                     },
//                     child: Image.asset(
//                       "assets/Medicines.jpg",
//                       height: 160,
//                       width: 160,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Must Have",
//                   style: GoogleFonts.poppins(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "See all",
//                     style: GoogleFonts.poppins(
//                       fontSize: 12,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               height: 200,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
                  // productCard("Everherb Jamun Juice", "250Gms", "\$215.46", "assets/a.jpeg"),
                  // productCard("Healthy Seed Mix", "200Gms", "\$219.45", "assets/b.jpeg"),
                  // productCard("Hot Water Bag", "1pc", "\$209.40", "assets/c.jpeg"),
                  // productCard("Tongue Cleaner", "1pc", "\$84.15", "assets/d.jpeg"),
                  // productCard("Nail Cutter", "1pc", "\$49.45", "assets/e.jpeg"),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Personal care",
//                   style: GoogleFonts.poppins(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "See all",
//                     style: GoogleFonts.poppins(
//                       fontSize: 12,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               height: 200,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
                  // productCard("Uv SunScreen", "250Gms", "\$500.46", "assets/2.jpeg"),
                  // productCard(" Moisturizing Lotion", "200Gms", "\$219.45", "assets/3.jpeg"),
                  // productCard("Roasted Seed", "1pc", "\$209.40", "assets/4.jpeg"),
                  // productCard("Pain Relief Oil", "1pc", "\$84.15", "assets/1.webp"),
                  // productCard(" Skin Cleanser", "1pc", "\$49.45", "assets/5.jpeg"),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Elder Care",
//                   style: GoogleFonts.poppins(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "See all",
//                     style: GoogleFonts.poppins(
//                       fontSize: 12,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               height: 200,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
                //   productCard("Liveasy Adult Diape", "250Gms", "\$215.46", "assets/aaa.jpeg"),
                //   productCard("Pain Relief oil", "200Gms", "\$219.45", "assets/bbb.jpeg"),
                //   productCard("Calcium Magnesium ", "1pc", "\$209.40", "assets/ccc.jpeg"),
                //   productCard("Iodex Pain Relief Balm", "1pc", "\$84.15", "assets/ddd.jpeg"),
                //   productCard("Omnigel Gel", "1pc", "\$49.45", "assets/eee.jpeg"),
                // ],
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Must Have",
//                   style: GoogleFonts.poppins(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text(
//                     "See all",
//                     style: GoogleFonts.poppins(
//                       fontSize: 12,
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               height: 200,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
                  
//                   productCard("Septonsil Drops", "1pc", "\$140.45", "assets/11.jpeg"),
//                   productCard(" Diabetes Drops", "1pc", "\$459.45", "assets/12.jpeg"),
//                   productCard(" Calcarea Fluoricum ", "1pc", "\$1000.45", "assets/13.jpeg"),
//                   productCard("Hemorrhoidal Drop", "1pc", "\$500.45", "assets/14.jpeg"),
//                   productCard("Homeopathic Medicine", "1pc", "\$100.45", "assets/15.jpeg"),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 20)
//           ],
//         ),
//       ),
//     );
//   }

//   Widget productCard(String name, String size, String price, String imagePath, {String? oldPrice}) {
//     return Container(
//       width: 140,  // Set a fixed width for each product card
//       height: 200,
//       margin: const EdgeInsets.only(right: 10),
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: const Color.fromARGB(255, 202, 209, 208)),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           GestureDetector(
//             onTap: () {
//               Navigator.of(context).push(MaterialPageRoute(builder: (context) {
//                 return const ProductDetailPage();
//               }));
//             },
//             child: Image.asset(
//               imagePath,
//               height: 100, // Increased image height to better fit the layout
//               width: 120,  // Increased width to make image more prominent
//               fit: BoxFit.cover, // Ensures the image fits within the container
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             name,
//             style: GoogleFonts.poppins(
//               fontSize: 12,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           Text(
//             size,
//             style: GoogleFonts.poppins(
//               fontSize: 10,
//               color: Colors.grey,
//             ),
//           ),
//           const Spacer(),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   if (oldPrice != null)
//                     Text(
//                       oldPrice,
//                       style: GoogleFonts.poppins(
//                         fontSize: 10,
//                         color: Colors.grey,
//                         decoration: TextDecoration.lineThrough,
//                       ),
//                     ),
//                   Text(
//                     price,
//                     style: GoogleFonts.poppins(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
// // Image Carousel Widget
// class ImageCarousel extends StatefulWidget {
//   const ImageCarousel({super.key});

//   @override
//   _ImageCarouselState createState() => _ImageCarouselState();
// }

// class _ImageCarouselState extends State<ImageCarousel> {
//   PageController _pageController = PageController();
//   int _currentPage = 0;
//   Timer? _timer;

//   final List<String> _images = [
//     'assets/x.jpg',
//     'assets/y.jpg',
//     'assets/z.jpg',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _startAutoScroll();
//   }

//   void _startAutoScroll() {
//     _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
//       if (_currentPage < _images.length - 1) {
//         _currentPage++;
//       } else {
//         _currentPage = 0;
//       }
//       _pageController.animateToPage(
//         _currentPage,
//         duration: const Duration(milliseconds: 500),
//         curve: Curves.easeIn,
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _timer?.cancel();
//     _pageController.dispose();
//     super.dispose();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: const Color.fromARGB(255, 36, 172, 151),
//           ),
//         ),
//         height: 150,
//         child: PageView.builder(
//           controller: _pageController,
//           onPageChanged: (index) => _currentPage = index,
//           itemCount: _images.length,
//           itemBuilder: (context, index) {
//             return Image.asset(
//               _images[index],
//               fit: BoxFit.cover,
//             );
//           },
//         ),
//       ),
//     );
//   }
  
// }