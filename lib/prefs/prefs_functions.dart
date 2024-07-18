import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:synkrama_test/prefs/prefs.dart';

import '../models/user_model.dart';

class PreferenceHelper {
  static const userDetails = "user_details";
  static const userList = "user_list";

  static setUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userDetails, json.encode(user));
  }

  static getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString(userDetails);
    if (data != null && data.isNotEmpty) {
      return User.fromJson(json.decode(data));
    } else {
      return null;
    }
  }

  static setUsers(List<User> users) async {
    await Preferences.setString(userList, json.encode(users));
  }

  static Future<List<User>?> getUsers() async {
    List<User>? response = <User>[];
    String data = await Preferences.getString(userList, '');
    if (data != "[]" && data.isNotEmpty) {
      response =
          (json.decode(data) as List).map((e) => User.fromJson(e)).toList();
      return response;
    } else {
      return response;
    }
  }

  static Future<void> clearPreference() async {
    // await Preferences.remove(userDetails);
    await Preferences.remove("login");
  }
}
