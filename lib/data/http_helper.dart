import 'package:flutter_sample/data/weather.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:convert';

class HttpHelper {
  final String? domain = dotenv.env['DOMAIN'];
  final String? path = dotenv.env['PATH'];
  final String? apiKey = dotenv.env['APIKEY'];

  Future<Weather> getWeather(String location) async {
    Map<String, dynamic> parameters = {'q': location, 'appId': apiKey};
    Uri uri = Uri.https(domain!, path!, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
