import 'package:flutter/material.dart';

class Answer1 extends StatelessWidget {
  const Answer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Grid Layout"),
          backgroundColor: Colors.orange,
          centerTitle: true, // ทำให้ไตเติ้ลอยู่ตรงกลาง
        ),
        body: Center(
            child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100, // กำหนดความกว้าง
                  height: 100, // กำหนดความสูง
                  color: Colors.red, // กำหนดสี
                ),
                const SizedBox(width: 20),
                Container(
                  width: 100, // กำหนดความกว้าง
                  height: 100, // กำหนดความสูง
                  color: Colors.green, // กำหนดสี
                ),
                const SizedBox(width: 20),
                Container(
                  width: 100, // กำหนดความกว้าง
                  height: 100, // กำหนดความสูง
                  color: Colors.blue, // กำหนดสี
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 100, // กำหนดความกว้าง
                  height: 100, // กำหนดความสูง
                  color: Colors.orange, // กำหนดสี
                ),
                const SizedBox(width: 20),
                Container(
                  width: 100, // กำหนดความกว้าง
                  height: 100, // กำหนดความสูง
                  color: Colors.purple, // กำหนดสี
                ),
                const SizedBox(width: 20),
                Container(
                  width: 100, // กำหนดความกว้าง
                  height: 100, // กำหนดความสูง
                  color: Colors.yellow, // กำหนดสี
                ),
                const SizedBox(width: 20),
              ],
            ),
          ],
        )));
  }
}
