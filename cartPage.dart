// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:healthcare_app/PaymentPage.dart';
// import 'package:healthcare_app/pharmacy.dart';

// class CartPage extends StatefulWidget {
//   const CartPage({super.key});

//   @override
//   State<CartPage> createState() => _CartPageState();
// }

// void _confirmDelete(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text("Confirm Deletion"),
//         content: const Text("Are you sure you want to delete this product?"),
//         actions: [
//           TextButton(
//             child: const Text("Cancel"),
//             onPressed: () {
//               Navigator.of(context).pop(); 
//             },
//           ),
//           TextButton(
//             child: const Text("Delete"),
//             onPressed: () {
//               Navigator.of(context).pop(); 
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       ),
//     );
//   }

// class _CartPageState extends State<CartPage> {
//   List<Map<String, dynamic>> cartList = [];
//   double tax = 1.0;

//   @override
//   void initState() {
//     super.initState();
//     clearCartOnRestart(); // Clear the cart in Firestore
//     getCartItems();       // Fetch updated (empty) cart
//   }

//   /// Clear the cart collection in Firestore
//   Future<void> clearCartOnRestart() async {
//     var collection = FirebaseFirestore.instance.collection('cart');
//     var snapshots = await collection.get();
//     for (var doc in snapshots.docs) {
//       await doc.reference.delete();
//     }
//   }

//   Future<void> getCartItems() async {
//     QuerySnapshot response =
//         await FirebaseFirestore.instance.collection('cart').get();
//     cartList = response.docs.map((doc) {
//       return {
//         'id': doc.id,
//         'name': doc['name'],
//         'price': doc['price'],
//         'quantity': doc['quantity'],
//         'ImgURL': doc['ImgURL'],
//       };
//     }).toList();
//     setState(() {});
//   }

//   double getSubtotal() {
//     return cartList.fold(
//         0.0, (sum, item) => sum + item['price'] * item['quantity']);
//   }

//   @override
//   Widget build(BuildContext context) {
//     double subtotal = getSubtotal();
//     double total = subtotal + tax;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => ProductGridPage()));
//           },
//         ),
//         title: Text(
//           "My Cart",
//           style: GoogleFonts.poppins(fontSize: 18, color: Colors.black),
//         ),
//         centerTitle: true,
//       ),
//       body: cartList.isEmpty
//           ? Center(
//               child: Text(
//                 'No items added to the cart.',
//                 style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey),
//               ),
//             )
//           : SingleChildScrollView(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 300,
//                     child: ListView.builder(
//                       itemCount: cartList.length,
//                       itemBuilder: (context, index) {
//                         var item = cartList[index];
//                         return _cartItem(
//                           context,
//                           item['ImgURL'],
//                           item['name'],
//                           item['quantity'],
//                           item['price'],
//                           (quantity) => updateQuantity(index, quantity),
//                           () => deleteCartItem(index),
//                         );
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   Text(
//                     "Payment Detail",
//                     style: GoogleFonts.poppins(
//                         fontSize: 16, fontWeight: FontWeight.w600),
//                   ),
//                   const SizedBox(height: 10),
//                   _paymentDetailRow("Subtotal", "\$${subtotal.toStringAsFixed(2)}"),
//                   _paymentDetailRow("Taxes", "\$${tax.toStringAsFixed(2)}"),
//                   _paymentDetailRow("Total", "\$${total.toStringAsFixed(2)}",
//                       isBold: true),
//                   const SizedBox(height: 20),
//                   Center(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.teal,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                         padding:
//                             const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
//                       ),
//                       onPressed: () {
//                         Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => const Paymentpage()),
//                         );
//                       },
//                       child: Text(
//                         "Checkout",
//                         style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   /// Update item quantity
//   void updateQuantity(int index, int newQuantity) {
//     if (newQuantity < 1) return; // Prevent quantity from being less than 1
//     setState(() {
//       cartList[index]['quantity'] = newQuantity;
//     });
//   }

//   /// Delete an item from the cart
//   void deleteCartItem(int index) {
//     setState(() {
//       cartList.removeAt(index);
//     });
//   }

//   Widget _cartItem(
//     BuildContext context,
//     String imagePath,
//     String title,
//     int quantity,
//     double price,
//     ValueChanged<int> onQuantityChanged,
//     VoidCallback onDelete,
//   ) {
//     return Container(
//       margin: const EdgeInsets.only(bottom: 16),
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.grey[100],
//       ),
//       child: Row(
//         children: [
//           Image.network(
//             imagePath, 
//             height: 50,
//             width: 50,
//             fit: BoxFit.cover,
//             errorBuilder: (context, error, stackTrace) {
//               return 
              
             
//               Image.asset('assets/placeholder.png',
//                 height: 50,
//                 width: 50,
//                 fit: BoxFit.cover,
//               );
//             },
//             loadingBuilder: (context, child, loadingProgress) {
//               if (loadingProgress == null) return child; 
//               return const SizedBox(
//                 height: 50,
//                 width: 50,
//                 child: Center(
//                   child: CircularProgressIndicator(),
//                 ),
//               );
//             },
//           ),
//           const SizedBox(width: 10),
//           Expanded(
//             child: Text(
//               title,
//               style: GoogleFonts.poppins(
//                   fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//           ),
//           Row(
//             children: [
//               // IconButton(
//               //   icon: const Icon(Icons.remove),
//               //   onPressed: () => onQuantityChanged(quantity - 1),
//               // ),
//               IconButton(
//             icon: const Icon(Icons.delete),
//             onPressed: () => _confirmDelete(context),
//           ),
//               Text(
//                 quantity.toString(),
//                 style: GoogleFonts.poppins(
//                     fontSize: 16, fontWeight: FontWeight.w600),
//               ),
//               IconButton(
//                 icon: const Icon(Icons.add),
//                 onPressed: () => onQuantityChanged(quantity + 1),
//               ),
//             ],
//           ),
//           const SizedBox(width: 10),
//           Text(
//             "\$${(price * quantity).toStringAsFixed(2)}",
//             style:
//                 GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
//           ),
//           IconButton(
//             icon: const Icon(Icons.delete_outline, color: Colors.grey),
//             onPressed: onDelete,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _paymentDetailRow(String label, String amount, {bool isBold = false}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 4.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
//             ),
//           ),
//           Text(
//             amount,
//             style: GoogleFonts.poppins(
//               fontSize: 14,
//               fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_app/PaymentPage.dart';
import 'package:healthcare_app/pharmacy.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});
  
  get product => null;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> cartList = [];
  double tax = 1.0;

  @override
  void initState() {
    super.initState();
    clearCartOnRestart(); // Clear the cart in Firestore
    getCartItems();       // Fetch updated (empty) cart
  }

  /// Clear the cart collection in Firestore
  Future<void> clearCartOnRestart() async {
    var collection = FirebaseFirestore.instance.collection('cart');
    var snapshots = await collection.get();
    for (var doc in snapshots.docs) {
      await doc.reference.delete();
    }
  }

  Future<void> getCartItems() async {
    QuerySnapshot response =
        await FirebaseFirestore.instance.collection('cart').get();
    cartList = response.docs.map((doc) {
      return {
        'id': doc.id,
        'name': doc['name'],
        'price': doc['price'],
        'quantity': doc['quantity'],
        'ImgURL': doc['ImgURL'],
      };
    }).toList();
    setState(() {});
  }

  double getSubtotal() {
    return cartList.fold(
        0.0, (sum, item) => sum + item['price'] * item['quantity']);
  }

  @override
  Widget build(BuildContext context) {
    double subtotal = getSubtotal();
    double total = subtotal + tax;

    return Scaffold(
     appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue, // Start color (greenish shade)
                Colors.purple
                  // End color (darker green)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent, // Transparent for gradient
            elevation: 0, // Remove shadow for a clean look
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductGridPage()),
                );
              },
            ),
            title: Text(
              "My Cart",
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white, // Ensure text is visible on gradient
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: cartList.isEmpty
          ? Center(
              child: Text(
                'No items added to the cart.',
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.grey),
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                  height:150 ,
                    child: ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (context, index) {
                        var item = cartList[index];
                        return _cartItem(
                          context,
                          item['ImgURL'],
                          item['name'],
                          item['quantity'],
                          item['price'],
                          (quantity) => updateQuantity(index, quantity),
                          () => deleteCartItem(index),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Payment Detail",
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  _paymentDetailRow("Subtotal", "\Rs${subtotal.toStringAsFixed(2)}"),
                  _paymentDetailRow("Taxes", "\Rs${tax.toStringAsFixed(2)}"),
                  _paymentDetailRow("Total", "\Rs${total.toStringAsFixed(2)}",
                      isBold: true),
                  const SizedBox(height: 20),
                  Center(
                    child: 
                    Container(decoration: BoxDecoration(
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
                              borderRadius: BorderRadius.circular(20)),
                          padding:
                              const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Paymentpage()),
                          );
                        },
                        child: Text(
                          "Checkout",
                          style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  /// Update item quantity
  void updateQuantity(int index, int newQuantity) {
    if (newQuantity < 1) return; // Prevent quantity from being less than 1
    setState(() {
      cartList[index]['quantity'] = newQuantity;
    });
  }

  /// Delete an item from the cart
  void deleteCartItem(int index) {
    setState(() {
      cartList.removeAt(index);
    });
  }

  Widget _cartItem(
    BuildContext context,
    String imagePath,
    String title,
    int quantity,
    double price,
    ValueChanged<int> onQuantityChanged,
    VoidCallback onDelete,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[100],
      ),
      child: Row(
        children: [
          Image.asset(
            imagePath, 
            height: 50,
            width: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
               return  Image.asset(
             // return   Image.asset(widget.product.imageUrl, height: 200,
                'assets/placeholder.png',
              //  height: 50,
               width: 20,
                fit: BoxFit.cover,
              );
            },
            // loadingBuilder: (context, child, loadingProgress) {
            //    if (loadingProgress == null) return child; 
            //    return const SizedBox(
            //     height: 50,
            //      // width: 50,
            //      child: Center(
            //      child: CircularProgressIndicator(),
            //     ),
            //    );
            //  },
          ),

          
          const SizedBox(height: 30),
           Expanded(
             child: Text(
              title,
               style: GoogleFonts.poppins(
                   fontSize: 16, fontWeight: FontWeight.w600),
             ),
           ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () => onQuantityChanged(quantity - 1),
              ),
              Text(
                quantity.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w600),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => onQuantityChanged(quantity + 1),
              ),
            ],
          ),
          // const SizedBox(width: 10),
          Text(
            "\Rs${(price * quantity).toStringAsFixed(2)}",
            style:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.grey),
            onPressed: onDelete,
          ),
        ],
      ),
    );
  }

  Widget _paymentDetailRow(String label, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
          Text(
            amount,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}