class RespObj {
  bool _status, auth;
  String msg, token, id;
  int length;
  dynamic data;

  RespObj(
    this._status,
      {this.msg, this.data, this.auth, this.id, this.length, this.token});

  factory RespObj.fromJson(Map<String, dynamic> json) {
    try {
      return RespObj(json['status'],
          msg: json['msg'],
          data: json['data'],
          token: json['token'],
          id: json['id'],
          length: json['length']);
    } catch (e) {
      print(e);
    }
  }

  bool get status => _status;
}
