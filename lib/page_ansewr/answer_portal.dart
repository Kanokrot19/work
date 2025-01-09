import 'package:flutter/material.dart';
import 'package:flutterprojects/page_ansewr/answer1.dart';
import 'package:flutterprojects/page_ansewr/answer2.dart';
import 'package:flutterprojects/page_ansewr/answer3.dart';
import 'package:flutterprojects/page_ansewr/answer4.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Answer"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.cyan[100], // สีพื้นหลังตามภาพ
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ปุ่ม Answer1
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Answer1(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Answer1"),
              ),
              const SizedBox(height: 10), // เพิ่มระยะห่างระหว่างปุ่ม
              // ปุ่ม Answer2
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Answer2(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Answer2"),
              ),
              const SizedBox(height: 10),
              // ปุ่ม Answer3
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Answer3(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Answer3"),
              ),
              const SizedBox(height: 10),
              // ปุ่ม Answer4
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Answer4(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Answer4"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// หน้าสำหรับแสดงคำตอบ
class AnswerPage extends StatelessWidget {
  final String title;

  const AnswerPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
