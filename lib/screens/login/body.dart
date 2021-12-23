import 'package:ecommerceapp/config/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Text(
                'ＷＥＬＣＯＭＥ  ＢＡＣＫ',
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                'Sign in with your email and password',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  static Future<User?> LoginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user with this email');
      }
    }
    return user;
  }

  final _formkey = GlobalKey<FormState>();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  String? email;
  String? password;
  bool? remember = false;
  final List<String> errors = [];
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: buildEmaiFormField(),
            ),
            SizedBox(height: 5),
            buildPasswordFormField(),
            SizedBox(height: 20),
            Row(
              children: [
                Checkbox(
                    value: remember,
                    activeColor: Colors.black,
                    onChanged: (value) {
                      setState(() {
                        remember = value;
                      });
                    }),
                Text('Remember me'),
                Spacer(),
                Text(
                  'Forgot Password',
                  style: TextStyle(decoration: TextDecoration.underline),
                )
              ],
            ),
            SizedBox(height: 0.5),
            FormError(errors: errors),
            SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.black),
                onPressed: () async {
                  // User? user = await LoginUsingEmailPassword(
                  //     email: _emailController.text,
                  //     password: _passwordController.text,
                  //     context: context);
                  // print(user);
                  // if (user != null) {
                  Navigator.pushNamed(context, '/');
                },
                child: Text(
                  'Login',
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white),
                )),
            SizedBox(height: 20),
            Text('Dont have an account?'),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
                child: Text(
                  'Signup',
                  style: TextStyle(
                      color: Colors.black,
                      decoration: TextDecoration.underline),
                ))
          ],
        ));
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      obscuringCharacter: '*',
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
      },
      validator: (value) {
        if (value != null &&
            value.isEmpty &&
            !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
        } else if (value!.length < 8 && !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
        }

        return null;
      },
      controller: _passwordController,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
        labelText: 'Password',
        hintText: 'Enter your password',
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28), gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(28), gapPadding: 10),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Icon(Icons.lock),
        ),
      ),
    );
  }

  TextFormField buildEmaiFormField() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        onSaved: (newValue) => email = newValue,
        onChanged: (value) {
          if (value.isNotEmpty && errors.contains(kEmailNullError)) {
            setState(() {
              errors.remove(kEmailNullError);
            });
          } else if (emailValidatorRegExp.hasMatch(value) &&
              errors.contains(kInvalidEmailError)) {
            setState(() {
              errors.remove(kInvalidEmailError);
            });
          }
        },
        validator: (value) {
          if (value != null &&
              value.isEmpty &&
              !errors.contains(kEmailNullError)) {
            setState(() {
              errors.add(kEmailNullError);
            });
          } else if (!emailValidatorRegExp.hasMatch(value!) &&
              !errors.contains(kInvalidEmailError)) {
            setState(() {
              errors.add(kInvalidEmailError);
            });
          }

          return null;
        },
        controller: _emailController,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
          labelText: 'Email',
          hintText: 'Enter your email',
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28), gapPadding: 10),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28), gapPadding: 10),
          suffixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Icon(Icons.email),
          ),
        ));
  }
}

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(
            errors.length, (index) => formErrorText(errors[index])));
  }

  Row formErrorText(String error) {
    return Row(
      children: [Icon(Icons.error), Text(error)],
    );
  }
}

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
