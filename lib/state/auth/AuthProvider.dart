import 'dart:convert';

import 'package:blesket/core/api/api.dart';
import 'package:blesket/core/locator.dart';
import 'package:blesket/models/profileModel.dart';
import 'package:blesket/models/user/user.dart';
import 'package:blesket/state/auth/authEndpoints.dart';
import 'package:blesket/utils/logger.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final Api _api = locator.get<Api>();
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;
  ProfileModel? _profile;
  ProfileModel? get profile => _profile;

  AuthProvider() {
    // getAuth();
  }

  getAuth() async {
    final prefs = await SharedPreferences.getInstance();

    if (prefs.get('creds') != null) {
      _isLoggedIn = true;
      // getRooms();
      notifyListeners();
    }
  }

  Future login({password, email}) async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('creds');

    return await _api.postNoHeaders(
        endpoint: AuthEndpoints.login,
        params: {"email": email, "password": password}).then((value) {
      logger.i(value);
      // locator.get<RoomProvider>().setrooms(Room.fromJson(value.data));
      prefs.setString('user', jsonEncode(User.fromJson(value.data).toJson()));
      // return Room.fromJson(value.data);
      return User.fromJson(value.data);
    }).catchError((onError) {
      logger.w(onError);
      // return throw false;
    });
  }

  Future me({password, email}) async {
    final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('creds');

    return await _api
        .getHTTP(
      endpoint: AuthEndpoints.me,
    )
        .then((value) {
      logger.i("--me ${value}");
      // locator.get<RoomProvider>().setrooms(Room.fromJson(value.data));
      // prefs.setString('user', jsonEncode(User.fromJson(value.data).toJson()));
      // return Room.fromJson(value.data);
      _profile = ProfileModel.fromJson(value.data);
      notifyListeners();
    }).catchError((onError) {
      logger.w(onError);
      // return throw false;
    });
  }
}
