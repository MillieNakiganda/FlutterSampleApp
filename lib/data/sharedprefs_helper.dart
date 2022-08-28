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

  List<Session> getSessions() {
    List<Session> sessions = [];
    Set<String> keys = prefs.getKeys();
    for (var key in keys) {
      Session session =
          Session.fromJson(json.decode(prefs.getString(key) ?? ''));
      sessions.add(session);
    }
    return sessions;
  }
}
