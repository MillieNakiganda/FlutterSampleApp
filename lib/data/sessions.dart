class Session {
  int id = 0;
  String date = '';
  String description = '';
  int duration = 0;

  Session(
      {required this.id,
      required this.date,
      required this.description,
      required this.duration});

  // when we are assigning values to the class
  Session.fromJson(Map<String, dynamic> sessionMap) {
    id = sessionMap['id'] ?? 0;
    date = sessionMap['date'] ?? '';
    description = sessionMap['description'] ?? '';
    duration = sessionMap['duration'] ?? 0;
  }

  //when assigning the instance to a json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'description': description,
      'duration': duration
    };
  }
}
