import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/blocs/cart/cart_bloc.dart';
import 'package:ecommerceapp/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerceapp/config/models/models.dart';
import 'package:ecommerceapp/config/theme.dart';
import 'package:ecommerceapp/widgets/custom_appbar.dart';
import 'package:ecommerceapp/widgets/custom_navbar.dart';
import 'package:ecommerceapp/widgets/hero_carousel_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductScreen extends StatelessWidget {
  static const String routeName = '/product';
  const ProductScreen({Key? key, required this.product}) : super(key: key);
  static Route route({required Product product}) {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ProductScreen(product: product));
  }

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: product.name),
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    )),
                BlocBuilder<WishlistBloc, WishlistState>(
                  builder: (context, state) {
                    return IconButton(
                        onPressed: () {
                          context
                              .read<WishlistBloc>()
                              .add(WishlistProductAdded(product));

                          final snackBar = SnackBar(
                              content: Text('Added to your wishlist :)'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ));
                  },
                ),
                BlocBuilder<CartBloc, CartState>(
                  builder: (context, state) {
                    return ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.white),
                        onPressed: () {
                          context
                              .read<CartBloc>()
                              .add(CartProductAdded(product));
                          final snackBar =
                              SnackBar(content: Text('Added to your cart :)'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                          Navigator.pushNamed(context, '/cart');
                        },
                        child: Text(
                          'ADD TO CART',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.black),
                        ));
                  },
                )
              ],
            ),
          ),
        ),
        body: ListView(
          children: [
            HeroCarouselCard(
              product: product,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    color: Colors.black.withAlpha(50),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    width: MediaQuery.of(context).size.width - 10,
                    height: 50,
                    color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            product.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          ),
                          Text(
                            '\$${product.price}',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text('PRODUCT DESCRIPTION',
                    style: Theme.of(context).textTheme.headline6),
                children: [
                  ListTile(
                    title: Text('Amazing product should definitely buy it ',
                        style: Theme.of(context).textTheme.bodyText1),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ExpansionTile(
                initiallyExpanded: true,
                title: Text('SIZE DETAILS',
                    style: Theme.of(context).textTheme.headline6),
                children: [
                  ListTile(
                    title: Text('Amazing product should definitely buy it ',
                        style: Theme.of(context).textTheme.bodyText1),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
