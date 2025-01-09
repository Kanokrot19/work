import 'package:flutter/material.dart';

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int counter = 0; // ฟิลด์ที่เปลี่ยนแปลงได้ควรอยู่ใน State

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("StatefulWidget"),
        backgroundColor: Colors.yellow,
        centerTitle: true, // ทำให้ไตเติ้ลอยู่ตรงกลาง
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Counter = $counter",
                style: const TextStyle(fontSize: 20, color: Colors.red)),
            const SizedBox(height: 20),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              ElevatedButton(
                //ปุ่ม
                onPressed: () {
                  setState(() {
                    counter++; // อัปเดตค่า counter
                  });
                },
                child: const Icon(Icons.add),
              ), //ปุ่ม
              const SizedBox(width: 10,),
              ElevatedButton(
                //ปุ่ม
                onPressed: () {
                  setState(() {
                    if (counter <= 0) {
                      counter = 0;
                    }else{
                      counter--; // อัปเดตค่า counter
                    }
                  });
                },
                child: const Icon(Icons.remove),
              ), //ปุ่ม
              const SizedBox(width: 10,),
              ElevatedButton(
                //ปุ่ม
                onPressed: () {
                  setState(() {
                    counter = 0; // อัปเดตค่า counter
                  });
                },
                child: const Icon(Icons.replay),
              ), //ปุ่ม
            ]),
          ],
        ),
      ),
    );
  }
}
