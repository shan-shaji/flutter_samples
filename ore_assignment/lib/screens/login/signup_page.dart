import 'package:flutter/material.dart';
import 'package:oreassignment/constants/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:oreassignment/constants/dimensions.dart';
import 'package:oreassignment/constants/styles.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  primaryColor.withOpacity(1.0),
                  BlendMode.overlay,
                ),
                image: AssetImage(
                  "assets/images/background.jpg",
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RawMaterialButton(
                          constraints:
                              BoxConstraints(maxHeight: 40.0, maxWidth: 40.0),
                          onPressed: () {},
                          shape: CircleBorder(),
                          fillColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.facebook,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                        RawMaterialButton(
                          constraints:
                              BoxConstraints(maxHeight: 40.0, maxWidth: 40.0),
                          onPressed: () {},
                          shape: CircleBorder(),
                          fillColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.twitter,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                        RawMaterialButton(
                          constraints:
                              BoxConstraints(maxHeight: 40.0, maxWidth: 40.0),
                          onPressed: () {},
                          shape: CircleBorder(),
                          fillColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              FontAwesomeIcons.googlePlus,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height),
                    Text(
                      "Don't have an account?",
                      style: textH6Style.copyWith(color: Colors.white),
                    ),
                    SizedBox(height: 4.0),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        "Sign Up?",
                        style: textH6Style.copyWith(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
