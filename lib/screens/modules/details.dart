import 'package:ecommerce_training/models/product_model.dart';
import 'package:ecommerce_training/screens/widgets/build_details_item.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
  const DetailsScreen(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text("Details"),
        backgroundColor: Colors.grey[300],
      ),
      body: buildDetailsItem(product, context),
    );
  }
}
