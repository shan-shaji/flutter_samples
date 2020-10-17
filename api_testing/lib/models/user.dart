import 'dart:convert';

String postToJson(User user) {
  final userToJson = user.toJson();
  final parsedJson = json.encode(userToJson);
  return parsedJson;
}

class User {
  String name;
  String email;
  String password;
  String mobileno;
  String addr1;
  String addr2, pincode;
  double lat, long;

  User({
    this.name,
    this.email,
    this.password,
    this.mobileno,
    this.addr1,
    this.addr2,
    this.pincode,
    this.lat,
    this.long,
  });

  Map<String, dynamic> toJson() => {
        "password": password,
        "name": name,
        "email": email,
        "mobileno": mobileno,
        "addr1": addr1,
        "addr2": addr2,
        "pincode": pincode,
        "lat": lat,
        "long": long
      };
}
