import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_app/cartPage.dart';
import 'product.dart';
import 'PaymentPage.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  ProductDetail({super.key, required this.product});

  @override
 
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int quantity = 1; 
  bool isFavorite = false;
 double rating = 0;

  void _confirmDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirm Deletion"),
        content: const Text("Are you sure you want to delete this product?"),
        actions: [
          TextButton(
            child: const Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop(); 
            },
          ),
          TextButton(
            child: const Text("Delete"),
            onPressed: () {
              Navigator.of(context).pop(); 
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color.fromRGBO(250,232,250,1),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56.0), // Adjust height as needed
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.purple,
                Colors.blue,
                 // Start color (teal-like)
               // End color (darker teal)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            title: Text(widget.product.name,
            style: const TextStyle(color: Colors.white,),),
            backgroundColor: Colors.transparent, // Transparent for gradient
            elevation: 0, // Remove shadow if desired
          ),
          
        ),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 15,),
            Image.asset(widget.product.imageUrl, height: 200),
            const SizedBox(height: 20),
            Text(widget.product.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(
              "\$${(widget.product.price).toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child:Row(
  children: [
   Row(
  children: [
    Padding(
  padding: const EdgeInsets.all(10.0),
  child: Row(
    children: [
      Row(
        children: List.generate(
          5,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                rating = index + 1.0;
              });
              FirebaseFirestore.instance.collection('productRatings').add({
                'productName': widget.product.name,
                'rating': rating,
              });
             
            },
            child: Icon(
              index < rating
                  ? Icons.star
                  : Icons.star_border, 
              color: Colors.blue,
              size: 16,
            ),
          ),
        ),
      ),
      const SizedBox(width: 5),
    ],
  ),
),

  ],
),
    const SizedBox(width: 5),
    Text(
      rating.toStringAsFixed(1),
      style: GoogleFonts.poppins(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),
  
                  const Spacer(),
                  // IconButton(
                  //   icon: Icon(
                  //     isFavorite ? Icons.favorite : Icons.favorite_border,
                  //     color: isFavorite ? Colors.red : Colors.grey,
                  //   ),
                  IconButton(
  icon: Icon(
    isFavorite ? Icons.favorite : Icons.favorite_border,
    color: isFavorite ? Colors.red : Colors.grey,
  ),
  onPressed: () async {
    setState(() {
      isFavorite = !isFavorite;
    });

    if (isFavorite) {
      await FirebaseFirestore.instance.collection('wishList').add({
        'name': widget.product.name,
        'price': widget.product.price,
        'ImgURL': widget.product.imageUrl,
        'quantity': quantity,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product added to wishlist.')),
      );
    } else {
    }
  },
),

                   IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _confirmDelete(context),
          ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                      ),
                      Text(
                        quantity.toString(),
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                  Text(
                    "\$${(widget.product.price * quantity).toStringAsFixed(2)}",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),           
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "They are specifically designed to target health issues effectively, providing relief from symptoms and promoting recovery.Additionally, they help prevent diseases through vaccines and support long-term health management, allowing individuals to maintain stability in their daily routines",
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartPage()),
                    );
                  },
                  child: Text(
                    "Buy Now",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              
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
                    shadowColor: Colors.transparent
                  
                    ,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                   onPressed: () async {
                    print("INSTANCE: ${await FirebaseFirestore.instance}");
                    await FirebaseFirestore.instance.collection('cart').add({
                      'name': widget.product.name,
                      'price': widget.product.price,
                      'ImgURL': widget.product.imageUrl,
                      'quantity': quantity,
                      'totalPrice': widget.product.price * quantity,
                    });
                
                
                  ScaffoldMessenger.of(context).showSnackBar(
                 const  SnackBar(content: Text('Cart Items Added')),
                );
                
                  },
                  child: Text(
                    "My Cart",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}