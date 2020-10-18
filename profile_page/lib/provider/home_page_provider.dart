import 'package:flutter/cupertino.dart';
import 'package:profile_page/model/user.dart';

class HomePageView {
  User user = new User(
    name: "Shan Shaji",
    email: "shanshaji@gmail.com",
    profileImage: "assets/profile.jpeg",
  );
  bool __isEditing = false;
}

class HomepageViewModel extends HomePageView with ChangeNotifier {
  bool get getEditStatus => super.__isEditing;
  User get getUser => user;

  void setStatus(bool status) {
    super.__isEditing = status;
    notifyListeners();
  }

  void setUserName(String name) {
    user.name = name;
    super.__isEditing = false;
    notifyListeners();
  }

  void setEmail(String phoneNumber) {
    super.user.email = phoneNumber;
    super.__isEditing = false;
    notifyListeners();
  }
}
