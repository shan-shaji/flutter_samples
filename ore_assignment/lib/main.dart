import 'package:flutter/material.dart';
import 'package:oreassignment/screens/home_page.dart';
import 'package:oreassignment/screens/login/signup_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Map<String, WidgetBuilder> routes = {
    "/": (context) => HomePage(),
    "/signUp": (context) => SignUpPage()
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: routes,
      initialRoute: "/",
    );
  }
}
