import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HttpHelper {
  final String? domain = dotenv.env['DOMAIN'];
  final String? path = dotenv.env['PATH'];
  final String? apiKey = dotenv.env['APIKEY'];

  Future<String> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(domain!, path!, parameters);
    http.Response result = await http.get(uri);
    return result.body;
  }
}
