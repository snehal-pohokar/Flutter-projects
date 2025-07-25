import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthcare_app/homescreen.dart';
import 'package:healthcare_app/pharmacy.dart';
import 'package:healthcare_app/productDetailPage.dart';
import 'package:healthcare_app/productListingPage.dart';

class Paymentpage extends StatefulWidget {
  const Paymentpage({super.key});

  @override
  State<Paymentpage> createState() => _PaymentPage();
}

class _PaymentPage extends State<Paymentpage> {
  String? selectedPaymentMethod; 

  void navigateToProductDetail(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => ProductDetailPage(product: ,),
      //   ),
      // );
    });
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
                Colors.blue, // Start color (purple)
                Colors.purple, // End color (blue)
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
              "Payment",
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white, // White text for contrast
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Payment Method",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              _paymentMethodItem(context, "assets/visa.jpg", "visa"),
              _paymentMethodItem(context, "assets/mastercard.png", "mastercard"),
              _paymentMethodItem(context, "assets/UPI.jpeg", "UPI"),
                _paymentMethodItem(context, "assets/cod.webp", "Cash on delivery"),

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
                      backgroundColor: selectedPaymentMethod != null
                          ? Colors.green
                          : Colors.grey,
                          shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                    ),
                    onPressed: selectedPaymentMethod != null
                        ? () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) =>  ProductGridPage()),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Payment processed successfully!',
                                  style: GoogleFonts.poppins(),
                                ),
                              ),
                            );
                          }
                        : null, 
                    child: Text(
                      "Pay Now",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentMethodItem(BuildContext context, String imagePath, String paymentMethod) {
    bool isSelected = selectedPaymentMethod == paymentMethod; 

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = isSelected ? null : paymentMethod; 
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.purple.withOpacity(0.2) : Colors.grey[200], 
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Image.asset(
              imagePath,
              width: 40, 
              height: 40, 
              fit: BoxFit.cover,
            ),
            SizedBox(width: 20),
            Text(
              paymentMethod
            ),
            // const SizedBox(width: 150),
            Icon(
              isSelected ? Icons.check_circle : Icons.check_circle_outline, 
              color: isSelected ? Colors.green : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}