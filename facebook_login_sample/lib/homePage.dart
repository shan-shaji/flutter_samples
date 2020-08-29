import 'dart:convert';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart' as fl;
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoggedIn = false;
  String _name, _userProfileImage;
  List<String> _feed;
  void initiateFacebookLogin() async {
    var facebookLogin = fl.FacebookLogin();
    final facebookLoginResult = await facebookLogin.logIn(['email']);
    switch (facebookLoginResult.status) {
      case fl.FacebookLoginStatus.error:
        print("Error ${facebookLoginResult.errorMessage}");
        onLoginStatusChanged(isLoggedIN: false);
        break;
      case fl.FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(isLoggedIN: false);
        break;
      case fl.FacebookLoginStatus.loggedIn:
        print("LoggedIn");
        var userDataResponse = await http.get(
            'https://graph.facebook.com/v7.0/me?fields=name,first_name,last_name,picture&access_token=${facebookLoginResult.accessToken.token}');
        print(userDataResponse.body);
        var profile = json.decode(userDataResponse.body);
        print(profile.toString());

        onLoginStatusChanged(isLoggedIN: true, profileData: profile);
        break;
    }
  }

  void onLoginStatusChanged({bool isLoggedIN, var profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIN;
    });
    _name = profileData['name'];
    _userProfileImage = profileData['picture']['data']['url'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook Login"),
      ),
      body: Container(
        child: Center(
          child: isLoggedIn
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(_userProfileImage),
                          radius: 50.0,
                        ),
                      ),
                      Text("Logged In as ${_name}😁")
                    ],
                  ),
                )
              : FacebookSignInButton(
                  onPressed: () => initiateFacebookLogin(),
                ),
        ),
      ),
    );
  }
}
