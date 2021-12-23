import 'package:ecommerceapp/widgets/cart_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerceapp/blocs/checkout/checkout_bloc.dart';
import 'package:ecommerceapp/widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Checkout'),
      bottomNavigationBar: customNavBar(),
      body: BlocBuilder<CheckoutBloc, CheckoutState>(
        builder: (context, state) {
          if (state is CheckoutLoading) {
            return CircularProgressIndicator();
          }
          if (state is CheckoutLoaded) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CUSTOMER INFORMATION',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(email: value));
                  }, context, 'Email'),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(fullName: value));
                  }, context, 'Full Name'),
                  SizedBox(height: 20),
                  Text(
                    'DELIVERY INFORMATION',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(address: value));
                  }, context, 'Address'),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(city: value));
                  }, context, 'City'),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(country: value));
                  }, context, 'Country'),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(zipCode: value));
                  }, context, 'ZIP Code'),
                  SizedBox(height: 20),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(color: Colors.black),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(
                          child: Text(
                            'SELECT A PAYMENT METHOD',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Order Summary',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
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
                                  '\$${state.subtotal}',
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
                                  '\$${state.deliveryFee}',
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
                                    '\$${state.total}',
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
                                  onPressed: () {},
                                  child: Text('Confirm Order'))
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

Padding _buildTextFormField(
  Function(String)? onChanged,
  BuildContext context,
  String labelText,
) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      children: [
        SizedBox(
          width: 75,
          child: Text(
            labelText,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        Expanded(
          child: TextFormField(
            onChanged: onChanged,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: const EdgeInsets.only(left: 10),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
