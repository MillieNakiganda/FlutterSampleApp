import 'package:flutter/material.dart';
import 'package:flutter_sample/data/sessions.dart';
import 'package:flutter_sample/data/sharedPrefs_helper.dart';

class SessionsScreen extends StatefulWidget {
  const SessionsScreen({Key? key}) : super(key: key);

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  List<Session> sessions = [];
  final TextEditingController txtDescription = TextEditingController();
  final TextEditingController txtDuration = TextEditingController();
  final SharedPrefsHelper sphelper = SharedPrefsHelper();

  @override
  void initState() {
    sphelper.init().then((value) {
      updateScreen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Training Sessions')),
      body: ListView(children: getContent()),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            showSessionDialog(context);
          }),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Insert Training Session'),
            content: SingleChildScrollView(
                child: Column(
              children: [
                TextField(
                  controller: txtDescription,
                  decoration: const InputDecoration(hintText: 'Description'),
                ),
                TextField(
                  controller: txtDuration,
                  decoration: const InputDecoration(hintText: 'Duration'),
                )
              ],
            )),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    txtDescription.text = '';
                    txtDuration.text = '';
                  },
                  child: const Text('Cancel')),
              ElevatedButton(onPressed: saveSession, child: const Text('Save'))
            ],
          );
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year} - ${now.month} - ${now.day}';
    int id = sphelper.getCounter();
    Session newSession = Session(
        id: id,
        date: today,
        description: txtDescription.text,
        duration: int.tryParse(txtDuration.text) ?? 0);
    sphelper.writeSession(newSession).then((_) {
      updateScreen();
      sphelper.setCounter();
    });

    txtDescription.text = '';
    txtDuration.text = '';
    Navigator.pop(context);
  }

  List<Widget> getContent() {
    List<Widget> tiles = [];
    for (var session in sessions) {
      tiles.add(Dismissible(
        key: UniqueKey(),
        onDismissed: (_) {
          sphelper.deleteSession(session.id).then((value) => updateScreen());
        },
        child: ListTile(
          title: Text(session.description),
          subtitle: Text('${session.date} - duration: ${session.duration} min'),
        ),
      ));
    }
    return tiles;
  }

  void updateScreen() {
    sessions = sphelper.getSessions();
    setState(() {});
  }
}
