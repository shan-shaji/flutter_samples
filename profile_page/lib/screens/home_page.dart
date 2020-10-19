import 'package:flutter/material.dart';
import 'package:profile_page/constants/colors.dart';
import 'package:profile_page/constants/styles.dart';
import 'package:profile_page/provider/home_page_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  bool _isEditing = true;

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  TextEditingController _editingNameController, _editingEmailController;
  @override
  Widget build(BuildContext context) {
    HomepageViewModel homePageViewModel =
        Provider.of<HomepageViewModel>(context);
    _editingNameController = new TextEditingController(
      text: homePageViewModel.getUser.name,
    );
    _editingEmailController = new TextEditingController(
      text: homePageViewModel.getUser.email,
    );

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [profileContainerColor, profileContainerColor2],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 90.0,
                    backgroundImage:
                        AssetImage(homePageViewModel.getUser.profileImage),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20.0,
                          vertical: 10.0,
                        ),
                        child: Text("FOLLOW", style: ktextStyle),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Consumer<HomepageViewModel>(
                    builder: (context, homePageViewModel, child) {
                      return homePageViewModel.getEditStatus
                          ? Container(
                              width: 500,
                              child: TextField(
                                textAlign: TextAlign.center,
                                onSubmitted: (name) {
                                  homePageViewModel.setUserName(name);
                                },
                                controller: _editingNameController,
                                focusNode: focusNode1,
                                style: ktextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                ),
                                cursorColor: Colors.white,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                  Text(
                                    homePageViewModel.getUser.name,
                                    style: ktextStyle.copyWith(
                                      color: Colors.white,
                                      fontSize: 30.0,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      homePageViewModel.setStatus(true);
                                    },
                                  ),
                                ]);
                    },
                  ),
                  Consumer<HomepageViewModel>(
                    builder: (context, homePageViewModel, child) {
                      return homePageViewModel.getEditStatus
                          ? Container(
                              width: 500,
                              child: TextField(
                                textAlign: TextAlign.center,
                                onSubmitted: (email) {
                                  homePageViewModel.setEmail(email);
                                },
                                controller: _editingEmailController,
                                focusNode: focusNode2,
                                style: ktextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                ),
                                cursorColor: Colors.white,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  homePageViewModel.getUser.email,
                                  style: ktextStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//end of the program
