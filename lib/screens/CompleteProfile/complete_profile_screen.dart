import 'package:flutter/material.dart';

import 'components/body.dart';

class CompleteprofileScreen extends StatelessWidget {
  static const String routeName = '/completeProfile';
  const CompleteprofileScreen({Key? key}) : super(key: key);

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const CompleteprofileScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Body(),
    );
  }
}
