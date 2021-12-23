import 'dart:async';
import 'dart:ui';
import 'package:ecommerceapp/config/models/category_model.dart';
import 'package:ecommerceapp/config/models/models.dart';
import 'package:ecommerceapp/config/theme.dart';
import 'package:ecommerceapp/screens/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splash';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => SplashScreen());
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 4), () => Navigator.pushNamed(context, '/login'));
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image(
                image: AssetImage('assets/images/ecomp.jpeg'),
                width: 300,
                height: 300),
          ),
        ],
      ),
    );
  }
}
