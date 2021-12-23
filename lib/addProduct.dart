import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddProduct extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int price;
  final String category;
  final bool isRecommended;
  final bool isPopular;

  AddProduct(this.name, this.imageUrl, this.price, this.category,
      this.isRecommended, this.isPopular);

  @override
  Widget build(BuildContext context) {
    CollectionReference product =
        FirebaseFirestore.instance.collection('products');

    Future<void> addProduct() {
      return product
          .add({
            'name': name,
            'price': price,
            'category': category,
            'imageUrl': imageUrl,
            'isPopular': isPopular,
            'isRecommended': isRecommended
          })
          .then((value) => print("Product Added"))
          .catchError((error) => print("Failed to add product: $error"));
    }

    return TextButton(
      onPressed: addProduct,
      child: Text(
        "Add Product",
      ),
    );
  }
}
