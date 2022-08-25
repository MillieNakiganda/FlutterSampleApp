import 'package:http/http.dart' as http;

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?q=London&appid=f836359f0c7af8592e1a53401593cc89
  final String domain = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = 'f836359f0c7af8592e1a53401593cc89';

  Future<String> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(domain, path, parameters);
    http.Response result = await http.get(uri);
    return result.body;
  }
}
