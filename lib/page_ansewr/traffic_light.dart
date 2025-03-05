import 'package:flutter/material.dart';

class TrafficLight extends StatefulWidget {
  const TrafficLight({super.key});

  @override
  State<TrafficLight> createState() => _TrafficLightState();
}

class _TrafficLightState extends State<TrafficLight> {
  double _opacityRed = 1.0;
  double _opacityYellow = 0.3;
  double _opacityGreen = 0.3;
  int _color = 0;

  void _changeLight() {
    setState(() {
      if (_color == 0) {
        _color = 1;
      } else if (_color == 1) {
        _color = 2;
      } else if (_color == 2) {
        _color = 0;
      }

      if (_color == 0) {
        _opacityRed = 1.0;
        _opacityYellow = 0.3;
        _opacityGreen = 0.3;
      } else if (_color == 1) {
        _opacityRed = 0.3;
        _opacityYellow = 1.0;
        _opacityGreen = 0.3;
      } else if (_color == 2) {
        _opacityRed = 0.3;
        _opacityYellow = 0.3;
        _opacityGreen = 1.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Traffic Ligth Animation',
                style: TextStyle(color: Colors.white)),
            centerTitle: true,
            backgroundColor: Colors.purple),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                opacity: _opacityRed,
                duration:
                    const Duration(milliseconds: 500), // ระยะเวลาของ Animation
                child: Container(
                  width: 100, //เปลี8ยนขนาดความกว้าง
                  height: 100, //เปลี8ยนขนาดสูง
                  decoration: BoxDecoration(
                    color: Colors.red, //เปลี8ยนสี
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SizedBox(height: 20),
              AnimatedOpacity(
                opacity: _opacityYellow,
                duration:
                    const Duration(milliseconds: 500), // ระยะเวลาของ Animation
                child: Container(
                  width: 100, //เปลี8ยนขนาดความกว้าง
                  height: 100, //เปลี8ยนขนาดสูง
                  decoration: BoxDecoration(
                    color: Colors.yellow, //เปลี8ยนสี
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SizedBox(height: 20),
              AnimatedOpacity(
                opacity: _opacityGreen,
                duration:
                    const Duration(milliseconds: 500), // ระยะเวลาของ Animation
                child: Container(
                  width: 100, //เปลี8ยนขนาดความกว้าง
                  height: 100, //เปลี8ยนขนาดสูง
                  decoration: BoxDecoration(
                    color: Colors.green, //เปลี8ยนสี
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: _changeLight, child: Text('เปลี่ยนไฟ'))
            ],
          ),
        ));
  }
}
