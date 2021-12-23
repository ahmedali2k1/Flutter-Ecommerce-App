import 'package:ecommerceapp/config/models/category_model.dart';
import 'package:ecommerceapp/config/models/models.dart';
import 'package:ecommerceapp/screens/CompleteProfile/complete_profile_screen.dart';
import 'package:ecommerceapp/screens/cart/cart_screen.dart';
import 'package:ecommerceapp/screens/catalog/catalog_screen.dart';
import 'package:ecommerceapp/screens/checkout/checkout_screen.dart';
import 'package:ecommerceapp/screens/home/home_screen.dart';
import 'package:ecommerceapp/screens/login/login.dart';
import 'package:ecommerceapp/screens/products/product_screen.dart';
import 'package:ecommerceapp/screens/profile/profile_screen.dart';
import 'package:ecommerceapp/screens/signup/signup_screen.dart';
import 'package:ecommerceapp/screens/wishlist/wishlist_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/screens.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case SignUpScreen.routeName:
        return SignUpScreen.route();
      case CompleteprofileScreen.routeName:
        return CompleteprofileScreen.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);

      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text('Error')),
            ));
  }
}
