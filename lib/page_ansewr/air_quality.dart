import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutterprojects/model/air_quality_data.dart';

class AirQualityApp extends StatefulWidget {
  const AirQualityApp({super.key});

  @override
  State<AirQualityApp> createState() => _AirQualityAppState();
}

class _AirQualityAppState extends State<AirQualityApp> {
  AirQualityData? airQuality;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchAirQualityData();
  }

  Future<void> fetchAirQualityData() async {
    const String token =
        'f80416e30861c1e02ee3673883dd40f48afc0d4c'; // ใส่ Token ของคุณที่นี่
    const String apiUrl = 'https://api.waqi.info/feed/Bangkok/?token=$token';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        setState(() {
          airQuality = AirQualityData.fromJson(jsonDecode(response.body));
          isLoading = false;
        });
      } else {
        print('Failed to load data');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Air Quality Index (AQI)",
              style: TextStyle(
                color: Colors.white,
              )),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 198, 169, 237)),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : airQuality == null
              ? const Center(child: Text('No data available'))
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ชื่อเมือง
                      Text(
                        airQuality!.city,
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),

                      // กรอบสีเขียวครอบเลข AQI และสถานะ AQI
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color:
                              airQuality!.aqi > 100 ? Colors.red : Colors.green,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // ค่า AQI
                            Text(
                              airQuality!.aqi.toString(),
                              style: const TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            // สถานะ AQI
                            Text(
                              airQuality!.aqi > 100 ? 'Unhealthy' : 'Healthy',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // อุณหภูมิ
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Temperature: ${airQuality!.temperature.toStringAsFixed(1)}°C',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),

                      // ปุ่ม Refresh (สี่เหลี่ยมผืนผ้า)
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 72, 152, 222),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          foregroundColor:
                              Colors.white, // เปลี่ยนสีข้อความของปุ่มที่นี่
                        ),
                        onPressed: fetchAirQualityData,
                        child: const Text(
                          'Refresh',
                          style: TextStyle(fontSize: 18),
                        ),
                      )
                    ],
                  ),
                ),
    );
  }
}
