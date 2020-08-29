import 'package:flutter/material.dart';
import 'package:oreassignment/screens/login/login_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LoginPage(),
      ),
    );
  }
}
