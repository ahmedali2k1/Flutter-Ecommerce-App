import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser extends StatelessWidget {
  final String firstName;
  final String lastName;
  final int phoneNumber;
  final String address;
  final String email;
  final String password;

  AddUser(this.firstName, this.lastName, this.phoneNumber, this.address,
      this.email, this.password);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      return users
          .add({
            'first_name': firstName,
            'last_name': lastName,
            'phone_number': phoneNumber,
            'address': address,
            'email': email,
            'password': password
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return TextButton(
      onPressed: addUser,
      child: Text(
        "Add User",
      ),
    );
  }
}
