import 'package:flutter/material.dart';
import 'package:healthcare_app/productDetailPage.dart';


class Productlistingpage extends StatefulWidget {
  const Productlistingpage({super.key});
 
  @override
  State<Productlistingpage> createState() => _Productlistingpage();
}

class _Productlistingpage extends State<Productlistingpage> {
  void navigateToProductDetail(BuildContext context) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => ProductDetailPage(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Listing'),
      ),
      body: ListView(
        children: [
          ProductCategory(
            categoryName: 'Must Have',
            products: [
              Product(name: 'Panadol', imageUrl: 'https://via.placeholder.com/150', price: 15.99),
              Product(name: 'Bodrex Herbal', imageUrl: 'https://via.placeholder.com/150', price: 7.99),
              Product(name: 'Konidin', imageUrl: 'https://via.placeholder.com/150', price: 5.99),
            ],
          ),
          ProductCategory(
            categoryName: 'Homeopathy Care',
            products: [
              Product(name: 'Panadol', imageUrl: 'https://via.placeholder.com/150', price: 15.99),
              Product(name: 'Bodrex Herbal', imageUrl: 'https://via.placeholder.com/150', price: 7.99),
              Product(name: 'Konidin', imageUrl: 'https://via.placeholder.com/150', price: 5.99),
            ],
          ),
          ProductCategory(
            categoryName: 'Ayurvedic Care',
            products: [
              Product(name: 'Panadol', imageUrl: 'https://via.placeholder.com/150', price: 15.99),
              Product(name: 'Bodrex Herbal', imageUrl: 'https://via.placeholder.com/150', price: 7.99),
              Product(name: 'Konidin', imageUrl: 'https://via.placeholder.com/150', price: 5.99),
            ],
          ),
        ],
      ),
    );
  }
}


class ProductCategory extends StatelessWidget {
  final String categoryName;
  final List<Product> products;

  ProductCategory({required this.categoryName, required this.products});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            categoryName,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: products.map((product) {
              return GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ProductDetailPage(product: ,
                  //       // product: product
                  //       ),
                  //   ),
                  // );
                },
                child: ProductCard(product: product),
              );
            }).toList(),
          ),
        ),
      ],
    );
    }
  }
    // );
// }
class Product {
  final String name;
  final String imageUrl;
  final double price;

  Product({required this.name, required this.imageUrl, required this.price});
}

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(product.imageUrl),
          Text(product.name),
          Text('\$${product.price.toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}
    // );
  // }}