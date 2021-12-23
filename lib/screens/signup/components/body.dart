import 'package:ecommerceapp/config/theme.dart';
import 'package:flutter/material.dart';

import 'signup_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10), // 4%
                Text(
                  "Register Account",
                  style: Theme.of(context).textTheme.headline4,
                ),
                Text(
                  "Enter your details below",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                SignUpForm(),
                SizedBox(height: 10),

                SizedBox(height: 20),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
