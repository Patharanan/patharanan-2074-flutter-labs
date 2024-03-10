import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Home Page",
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int productId = 2074;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailsPage(productId: productId),
              ),
            );
          },
          child: Text('View Product Details'),
        ),
      ),
    );
  }
}

class ProductDetailsPage extends StatefulWidget {
  final int productId;

  const ProductDetailsPage({Key? key, required this.productId})
      : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  late String productDetails;

  @override
  void initState() {
    super.initState();

    productDetails = getProductDetails(widget.productId);
  }

  String getProductDetails(int productId) {
    if (productId == 2074) {
      return "Product details for product ID : ${productId}";
    } else {
      return "Product details not available.";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Center(
        child: Text(productDetails),
      ),
    );
  }
}
