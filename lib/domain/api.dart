import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class Weather {
  final double speed;
  final String description;
  final int clouds;
  final int humidity;
  final int pressure;
  final double temp;
  final String city;

  Weather(
      {required this.humidity,
      required this.pressure,
      required this.temp,
      required this.city,
      required this.speed,
      required this.description,
      required this.clouds});

  static fromJson(Map<String, dynamic> json) {
    return Weather(
      humidity: json["main"]["humidity"],
      pressure: json["main"]["pressure"],
      temp: json["main"]["temp"],
      city: json["name"],
      speed: json["wind"]["speed"],
      description: json["weather"][0]["description"],
      clouds: json["clouds"]["all"],
    );
  }

  static Future<Weather> getdata({required String myurl}) async {
    final url = Uri.parse(myurl);
    final resp = await http.get(url);
    final json = jsonDecode(resp.body);
    log(json.toString());
    final data = Weather.fromJson(json);

    return data;
  }
}

class Getweather {
  static Future<Weather> getcurrentweather(
      {required double let, required double lon}) async {
    final uri =
        'https://api.openweathermap.org/data/2.5/weather?lat=$let&lon=$lon&appid=bec89a28eb01bd6e3dc9ba8f93167739&units=metric';

    final data = await Weather.getdata(myurl: uri);
    log(data.toString());
    return data;
  }

  static Future<Weather> getcityweather({
    required String city,
  }) async {
    final uri =
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=bec89a28eb01bd6e3dc9ba8f93167739&units=metric';

    final data = await Weather.getdata(myurl: uri);
    log(data.toString());
    return data;
  }
}
