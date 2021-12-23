import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddCheckout extends StatelessWidget {
  final String customerName;
  final String address;
  final String city;
  final String country;
  final String zipCode;
  final String customerEmail;
  final String products;

  AddCheckout(this.customerName, this.city, this.country, this.address,
      this.customerEmail, this.products, this.zipCode);

  @override
  Widget build(BuildContext context) {
    CollectionReference checkout =
        FirebaseFirestore.instance.collection('checkout');

    Future<void> addCheckout() {
      return checkout
          .add({
            'Customer_name': customerName,
            'Customer_email': customerEmail,
            'Address': address,
            'City': city,
            'Country': country,
            'Products': products,
            'Zipcode': zipCode
          })
          .then((value) => print("Checkout Added"))
          .catchError((error) => print("Failed to add checkout: $error"));
    }

    return TextButton(
      onPressed: addCheckout,
      child: Text(
        "Add Checkout",
      ),
    );
  }
}
