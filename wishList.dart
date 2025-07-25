import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> wishlistItems = []; 

  @override
  void initState() {
    super.initState();
    _fetchWishlist();
  }

  Future<void> _fetchWishlist() async {
    QuerySnapshot snapshot = await _firestore.collection('wishList').get();
    setState(() {
      wishlistItems = snapshot.docs.map((doc) {
        var data = doc.data() as Map<String, dynamic>;
        data['id'] = doc.id;  
        return data;
      }).toList();
    });
  }

  Future<void> _removeFromWishlist(String docId) async {
    await _firestore.collection('wishList').doc(docId).delete();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Product removed from wishlist.')),
    );
    _fetchWishlist(); 
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
                Colors.purple, // Start color (purple)
                Colors.blue, 
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
              "WishList",
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white, // White text for contrast
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: wishlistItems.isEmpty
          ? const Center(child: Text('No items in wishlist.'))
          : ListView.builder(
              itemCount: wishlistItems.length,
              itemBuilder: (context, index) {
                final item = wishlistItems[index];

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: ListTile(
                    leading: Image.asset(item['ImgURL'], width: 50, height: 50, fit: BoxFit.cover),
                    title: Text(
                      item['name'],
                      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      '\$${item['price'].toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.black),
                      onPressed: () {
                        _removeFromWishlist(item['id']);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}