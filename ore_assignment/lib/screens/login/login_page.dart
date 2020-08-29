import 'package:flutter/material.dart';
import 'package:oreassignment/constants/colors.dart';
import 'package:oreassignment/constants/dimensions.dart';
import 'package:oreassignment/constants/styles.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: ListView(
            children: [
              Image(
                color: primaryColor,
                image: AssetImage('assets/images/car.png'),
              ),
              Center(
                child: Text(
                  "HIPPO CARS",
                  style: textH1Style,
                ),
              ),
              SizedBox(height: height + 20),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "User Name",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              SizedBox(height: height),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  fillColor: Colors.grey[100],
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      value: _isChecked,
                      checkColor: Colors.white,
                      activeColor: primaryColor,
                      onChanged: (isChecked) {
                        setState(() {
                          _isChecked = isChecked;
                        });
                      }),
                  Text(
                    "Remember me",
                    style: textH6Style,
                  )
                ],
              ),
              SizedBox(height: height),
              FlatButton(
                color: primaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, "/signUp");
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Text(
                    "LOGIN",
                    style: textH1Style.copyWith(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: height),
              Center(
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Forgot Password?",
                    style: textH6Style.copyWith(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
