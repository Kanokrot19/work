import 'dart:convert';
import 'package:http/http.dart' as http;

class AirQualityData {
  final int aqi;
  final String city;
  final double temperature;

  AirQualityData({required this.aqi, required this.city, required this.temperature});

  factory AirQualityData.fromJson(Map<String, dynamic> json) {
    return AirQualityData(
      aqi: json['data']['aqi'],
      city: json['data']['city']['name'],
      temperature: json['data']['iaqi']['t']['v'],
    );
  }
}
