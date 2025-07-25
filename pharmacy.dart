import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_app/cartPage.dart';
import 'package:healthcare_app/homescreen.dart';
import 'package:healthcare_app/navbar_screen.dart';
import 'package:healthcare_app/productDetailPage.dart';
import 'package:healthcare_app/wishList.dart';
import 'product.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductGridPage extends StatefulWidget {
  const ProductGridPage({super.key});

  @override
  State<ProductGridPage> createState() => _ProductGridPageState();
}

class _ProductGridPageState extends State<ProductGridPage> {
  List<Product> mustHaveProducts = [];
  List<Product> personalCareProducts = [];
  List<Product> elderCareProducts= [];


  @override
  
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 0), () async {
      print(await getData());
      await getData();
    }).then((b) {});
  }

  Future<List<Product>?> getData() async {
    log("InGet Data");
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection("mustHaveProducts").get();
      mustHaveProducts.clear();

     log("InGet Data");
    QuerySnapshot response1 =
        await FirebaseFirestore.instance.collection("personalCareProducts").get();
    personalCareProducts.clear();
    
     log("InGet Data");
    QuerySnapshot response2 =
        await FirebaseFirestore.instance.collection("elderCareProducts").get();
  elderCareProducts.clear();


    
    for (var value in response.docs) {
      log("${value["name"]}");
      log("${response.docs.length}");

      mustHaveProducts.add(Product(
          name: value["name"],
          price: double.parse(value["price"]),
          imageUrl: value["imgURL"]));

    }

    for (var value in response1.docs) {
      log("${value["name"]}");
      log("${response1.docs.length}");

      personalCareProducts.add(Product(
          name: value["name"],
          price: double.parse(value["price"]),
          imageUrl: value["imgURL"]));

    }

    for (var value in response2.docs) {
      log("${value["name"]}");
      log("${response2.docs.length}");

      elderCareProducts.add(Product(
          name: value["name"],
          price: double.parse(value["price"]),
          imageUrl: value["imgURL"]));

    }setState(() {});
  //  return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250,232,250,1),
      // appBar: AppBar(
      //   backgroundColor: Colors.teal,
      //     centerTitle: true,
      //     title: const Text("Products"),
      //     leading: IconButton(
      //         onPressed: () {
      //           Navigator.pushReplacement(
      //             context,
      //             MaterialPageRoute(
      //                 builder: (context) => const NavbarScreen()
      //             )
      //           );
      //         },
      //         icon: const Icon(
      //           Icons.arrow_back,
      //         )),
      //     actions: [
      //       IconButton(
      //         icon: const Icon(
      //           Icons.favorite_border,
      //           color: Colors.black,
      //         ),
      //         onPressed: () {
      //           Navigator.of(context).push(MaterialPageRoute(builder: (context){
      //             return WishlistPage();
      //           }));
      //         },
      //       ),
      //       IconButton(
      //         icon:
      //             const Icon(Icons.shopping_cart_rounded, color: Colors.black),
      //         onPressed: () {
      //           Navigator.of(context)
      //               .push(MaterialPageRoute(builder: (context) {
      //             return CartPage();
      //           }));
      //         },
      //       ),
      //     ]),


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
            title: const Text("Products",
            style: TextStyle(
              color: Colors.white,
            ),
            
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent, // Make the AppBar background transparent
            elevation: 0, // Remove the shadow if you want a flat look
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavbarScreen()),
                );
              },
              icon: const Icon(Icons.arrow_back,
              color: Colors.white,
              ),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite, color: Colors.white),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const WishlistPage();
                  }
                  ));
                },
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart,
                    color: Colors.white),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const CartPage();
                  }));
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(height: 17,),
            TextField(
              decoration: InputDecoration(
                focusColor: Colors.teal,
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: "Search drugs, category...",
                hintStyle: GoogleFonts.poppins(fontSize: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                      color: Color.fromARGB(255, 3, 132, 119), width: 2),
                ),
                fillColor: const Color.fromARGB(255, 10, 71, 61),
              ),
            ),
            const SizedBox(height: 15),
            const ImageCarousel(),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(206, 217, 237, 0.902),
                  borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Order quickly with Prescription",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Colors.purple, // Start color (purple)
                Colors.blue, // End color (blue)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(20), // Match button's border radius
          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Upload Prescription",
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      "assets/Medicines.jpg",
                      height: 160,
                      width: 160,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          
            buildProductSection(context, "Personal Care", personalCareProducts),
            const SizedBox(height: 20),

              buildProductSection(context, "Elder Care", elderCareProducts),
            const SizedBox(height: 20),
        
            buildProductSection(context, "Must Have", mustHaveProducts),
          ],
        ),
      ),
    );
  }

  Widget buildProductSection(
      BuildContext context, String title, List<Product> productList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "See all",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        GridView.builder(
          padding: const EdgeInsets.all(10),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: productList.length,
          itemBuilder: (context, index) {
            final product = productList[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetail(product: product),
                  ),
                );
              },
              child: Card(
                elevation: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: Image.asset(product.imageUrl)),
                    const SizedBox(height: 10),
                    Text(
                      product.name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

// Image Carousel Widget (unchanged)
class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  final List<String> _images = [
    'assets/x.jpg',
    'assets/y.jpg',
    'assets/z.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        
        height: 150,
        child: PageView.builder(
          controller: _pageController,
          onPageChanged: (index) => _currentPage = index,
          itemCount: _images.length,
          itemBuilder: (context, index) {
            return Image.asset(
              _images[index],
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}