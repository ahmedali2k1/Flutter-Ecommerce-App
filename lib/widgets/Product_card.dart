import 'package:ecommerceapp/blocs/cart/cart_bloc.dart';
import 'package:ecommerceapp/config/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final bool iswish;
  final double leftpos;
  const ProductCard(
      {Key? key,
      required this.product,
      this.widthFactor = 2.5,
      this.iswish = false,
      this.leftpos = 5})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/product', arguments: product);
      },
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / widthFactor,
            height: 150,
            child: Image.network(product.imageUrl),
          ),
          Positioned(
            top: 80,
            left: leftpos,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5 - 20,
              height: 80,
              decoration: BoxDecoration(color: Colors.black.withAlpha(50)),
            ),
          ),
          Positioned(
            top: 85,
            left: leftpos + 5,
            child: Container(
              width: MediaQuery.of(context).size.width / 2.5 - 30,
              height: 70,
              decoration: BoxDecoration(color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.name,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: Colors.white),
                        ),
                        Text(
                          '\$${product.price}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.white),
                        )
                      ],
                    ),
                    BlocBuilder<CartBloc, CartState>(
                      builder: (context, state) {
                        if (state is CartLoading) {
                          return Center(child: CircularProgressIndicator());
                        }
                        if (state is CartLoaded) {
                          return Expanded(
                            child: IconButton(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0),
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  context
                                      .read<CartBloc>()
                                      .add(CartProductAdded(product));
                                  final snackBar = SnackBar(
                                      content: Text('Added to your cart :)'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }),
                          );
                        } else {
                          return Text('Something Went Wrong');
                        }
                      },
                      // iswish
                      //     ? Expanded(
                      //         child: IconButton(
                      //             padding: const EdgeInsets.symmetric(
                      //                 horizontal: 40.0),
                      //             icon: Icon(
                      //               Icons.delete,
                      //               color: Colors.white,
                      //             ),
                      //             onPressed: () {}),
                      //       )
                      //     : SizedBox(),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
