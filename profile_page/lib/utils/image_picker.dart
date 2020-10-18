import 'package:image_picker/image_picker.dart';
import 'package:profile_page/utils/shared_preferences.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';

class GetImage {
  File image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image = File(pickedFile.path);
      Prefs().storeString("profile", image.path);
      return image;
    } else {
      print('No image selected.');
    }
  }
}
