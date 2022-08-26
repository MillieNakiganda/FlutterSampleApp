// ignore: file_names
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'sessions.dart';

class SharedPrefsHelper {
  static late SharedPreferences prefs;
  Future init() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future writeSession(Session session) async {
    prefs.setString(session.id.toString(), jsonEncode(session.toJson()));
  }
}
