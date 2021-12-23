import 'package:flutter/material.dart';
import 'package:ecommerceapp/widgets/custom_navbar.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = "/profile";
  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => ProfileScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: customNavBar(),
    );
  }
}
