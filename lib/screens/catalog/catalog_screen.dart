import 'package:ecommerceapp/config/models/category_model.dart';
import 'package:ecommerceapp/config/models/models.dart';
import 'package:ecommerceapp/widgets/Product_card.dart';
import 'package:ecommerceapp/widgets/custom_appbar.dart';
import 'package:ecommerceapp/widgets/custom_navbar.dart';

import 'package:flutter/material.dart';

class CatalogScreen extends StatelessWidget {
  static const String routeName = '/catalog';
  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => CatalogScreen(category: category));
  }

  final Category category;
  const CatalogScreen({required this.category});
  @override
  Widget build(BuildContext context) {
    final List<Product> categoryProducts = Product.products
        .where((product) => product.category == category.name)
        .toList();
    return Scaffold(
        appBar: CustomAppBar(title: category.name),
        bottomNavigationBar: customNavBar(),
        body: GridView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.15),
            itemCount: categoryProducts.length,
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ProductCard(
                  widthFactor: 2.2,
                  product: categoryProducts[index],
                ),
              );
            }));
  }
}
