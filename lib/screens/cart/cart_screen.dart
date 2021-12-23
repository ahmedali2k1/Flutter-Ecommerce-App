import 'package:ecommerceapp/config/models/cart_model.dart';
import 'package:ecommerceapp/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerceapp/blocs/cart/cart_bloc.dart';
import 'package:ecommerceapp/widgets/widgets.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cart';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CartScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Cart'),
      bottomNavigationBar: customNavBar(),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return CircularProgressIndicator();
          }
          if (state is CartLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          shape: RoundedRectangleBorder(),
                          elevation: 0,
                        ),
                        child: Text(
                          'Add More Items',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                        itemCount: state.cart
                            .productQuantity(state.cart.products)
                            .keys
                            .length,
                        itemBuilder: (BuildContext context, int index) {
                          return CartProductCard(
                            product: state.cart
                                .productQuantity(state.cart.products)
                                .keys
                                .elementAt(index),
                            quantity: state.cart
                                .productQuantity(state.cart.products)
                                .values
                                .elementAt(index),
                          );
                        }),
                  ),
                  Column(
                    children: [
                      Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('SUBTOTAL',
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                                Text(
                                  '\$${state.cart.subtotalString}',
                                  style: Theme.of(context).textTheme.bodyText2,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('DELIVERY FEE',
                                    style:
                                        Theme.of(context).textTheme.bodyText2),
                                Text(
                                  '\$${state.cart.deliveryFeeString}',
                                  style: Theme.of(context).textTheme.bodyText2,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.all(5.0),
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.black.withAlpha(50),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.all(5.0),
                            height: 40,
                            decoration: BoxDecoration(color: Colors.black),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('TOTAL',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(color: Colors.white)),
                                  Text(
                                    '\$${state.cart.totalString}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.all(5.0),
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/checkout');
                                  },
                                  child: Text('Proceed To Checkout'))
                            ],
                          ))
                    ],
                  ),
                ],
              ),
            );
          }
          return Text('Something went wrong');
        },
      ),
    );
  }
}
