import 'package:flutter/cupertino.dart';
import 'package:profile_page/model/user.dart';
import 'dart:io';

import 'package:profile_page/utils/shared_preferences.dart';

class HomePageView {
  User user = new User(
    name: "Shan Shaji",
    email: "shanshaji@gmail.com",
  );

  bool _isEditing = false;
}

class HomepageViewModel extends HomePageView with ChangeNotifier {
  bool get getEditStatus => super._isEditing;
  String get getUserName => user.name;
  String get getUserEmail => user.email;
  String get profileImage => user.profileImage;

  void getInitialname() async {
    super.user.name = await Prefs().readString("name") ?? "Enter your name";
    print(super.user.name);
    notifyListeners();
  }

  void getInitialEmail() async {
    super.user.email = await Prefs().readString("email") ?? "Enter your email";
    print(super.user.email);
    notifyListeners();
  }

  void getInitialProfile() async {
    super.user.profileImage =
        await Prefs().readString("profile") ?? "assets/profile.jpeg";
    print(super.user.profileImage);
    notifyListeners();
  }

  void setStatus(bool status) {
    super._isEditing = status;
    notifyListeners();
  }

  void setUserName(String name) {
    super.user.name = name;
    Prefs().storeString("name", name);
    notifyListeners();
  }

  void setEmail(String email) {
    super.user.email = email;
    Prefs().storeString("email", email);
    notifyListeners();
  }

  void setProfile(String profileUrl) {
    super.user.profileImage = profileUrl;
    Prefs().storeString("profile", profileUrl);
    notifyListeners();
  }
}
