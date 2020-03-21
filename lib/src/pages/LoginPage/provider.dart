import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loginprovider/src/helpers/network.dart';
import 'package:loginprovider/src/pages/LoginPage/model.dart';

enum Status { LoginStart, LoginSuccess, LoginFailed }

class LoginProvider extends ChangeNotifier {

  UserModel _user;
  Status _status;
  String _error;
  NetWork _network = NetWork();

  UserModel get user => _user;
  Status get status => _status;
  String get error => _error;

  Future<bool> login({String phone, String password}) async {
    _status = Status.LoginStart;
    notifyListeners();

    var result = await _network.postData(
        url: "/login",
        formData: FormData.fromMap({
          "phone": phone,
          "password": password,
          "firebase_token": "87687",
          "lang": "en",
        }));

    if (result['message']) {
      _status = Status.LoginSuccess;
      _user = UserModel.fromJson(result);
      notifyListeners();
      return true;
    } else {
      _status = Status.LoginFailed;
      _error = result['data'];
      _user = null;
      notifyListeners();
      return false;
    }
  }
}
