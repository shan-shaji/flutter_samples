import 'package:flutter/material.dart';
import 'package:profile_page/constants/colors.dart';
import 'package:profile_page/constants/styles.dart';
import 'package:profile_page/provider/home_page_provider.dart';
import 'package:profile_page/utils/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';

class HomePage extends StatelessWidget {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  TextEditingController _editingNameController, _editingEmailController;

  void dispose() {
    _editingEmailController.dispose();
    _editingEmailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomepageViewModel homePageView = Provider.of<HomepageViewModel>(context);
    _editingNameController = new TextEditingController(
      text: homePageView.getUserName,
    );
    _editingEmailController = new TextEditingController(
      text: homePageView.getUserEmail,
    );

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
                  Container(
                    child: Stack(
                      children: [
                        Consumer<HomepageViewModel>(
                          builder: (builder, homePageViewModel, child) {
                            return CircleAvatar(
                              backgroundImage:
                                  homePageViewModel.profileImage != null
                                      ? FileImage(
                                          File(homePageViewModel.profileImage),
                                        )
                                      : AssetImage("assets/profile.jpeg"),
                              radius: 90.0,
                            );
                          },
                        ),
                        Positioned(
                          bottom: 0,
                          child: homePageView.getEditStatus == true
                              ? RawMaterialButton(
                                  fillColor: Colors.white,
                                  onPressed: () async {
                                    File image = await GetImage().getImage();
                                    homePageView.setProfile(image.path);
                                  },
                                  shape: CircleBorder(),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: profileContainerColor,
                                  ),
                                )
                              : Container(),
                        ),
                      ],
                    ),
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
                                decoration: InputDecoration(
                                  hintText: "Enter your name",
                                  hintStyle: ktextStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                                onSubmitted: (newName) {
                                  homePageViewModel.setUserName(newName);
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
                                    homePageViewModel.getUserName,
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
                                decoration: InputDecoration(
                                  hintText: "Enter your email",
                                  hintStyle: ktextStyle.copyWith(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                  ),
                                ),
                                textAlign: TextAlign.center,
                                onSubmitted: (newEmail) {
                                  homePageViewModel.setEmail(newEmail);
                                },
                                controller: _editingEmailController,
                                focusNode: focusNode2,
                                style: ktextStyle.copyWith(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                                cursorColor: Colors.white,
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  homePageViewModel.getUserEmail,
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
              SizedBox(
                height: 20.0,
              ),
              homePageView.getEditStatus == true
                  ? RawMaterialButton(
                      onPressed: () {
                        homePageView.setStatus(false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.check,
                          color: profileContainerColor,
                          size: 50.0,
                        ),
                      ),
                      fillColor: Colors.white,
                      shape: CircleBorder(),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
