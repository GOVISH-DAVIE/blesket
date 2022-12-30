import 'dart:convert';

import 'package:blesket/core/api/api.dart';
import 'package:blesket/core/locator.dart';
import 'package:blesket/state/auth/authEndpoints.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final Api _api = locator.get<Api>();
  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

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

  Future login({password, username}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('creds');
    await prefs.setString(
        'creds', jsonEncode({'username': username, 'password': password}));
    _api.refeshAuth();

    return await _api.getHTTP(endpoint: AuthEndpoints.rooms).then((value) {
      // locator.get<RoomProvider>().setrooms(Room.fromJson(value.data));

      // return Room.fromJson(value.data);
    }).catchError((onError) {
      // logger.w(onError);
      return throw false;
    });
  }
}
