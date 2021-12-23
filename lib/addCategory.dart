import 'package:ecommerceapp/addProduct.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCategory extends StatelessWidget {
  final String name;
  final String imageUrl;

  AddCategory(this.name, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    CollectionReference category =
        FirebaseFirestore.instance.collection('categories');

    Future<void> addCategory() {
      return category
          .add({
            'name': name,
            'imageUrl': imageUrl,
          })
          .then((value) => print("Category Added"))
          .catchError((error) => print("Failed to add category: $error"));
    }

    return TextButton(
      onPressed: addCategory,
      child: Text(
        "Add Category",
      ),
    );
  }
}
