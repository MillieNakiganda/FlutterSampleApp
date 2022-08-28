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
      //since we only have counter and different numbers as keys, so we only want those with numbers as keys
      if (key != 'counter') {
        Session session =
            Session.fromJson(json.decode(prefs.getString(key) ?? ''));
        sessions.add(session);
      }
    }
    return sessions;
  }

  // manual generation of ids for our sessions
  Future setCounter() async {
    int counter = prefs.getInt('counter') ?? 0;
    counter++;
    await prefs.setInt('counter', counter);
  }

  int getCounter() {
    return prefs.getInt('counter') ?? 0;
  }
}
