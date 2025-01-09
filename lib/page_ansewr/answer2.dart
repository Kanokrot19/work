import 'package:flutter/material.dart';

class Answer2 extends StatelessWidget {
  const Answer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Social Media Post"),
        backgroundColor: Colors.orange,
        centerTitle: true, // ทำให้ไตเติ้ลอยู่ตรงกลาง
      ),
      body: Center(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // จัดแนวข้อความให้อยู่ซ้าย
          children: [
            const SizedBox(height: 20), // เพิ่มระยะห่างด้านบน
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 10), // เว้นระยะห่างด้านซ้าย
                // รูปโปรไฟล์ (Avatar)
                const CircleAvatar(
                  radius: 30, // ขนาดของวงกลม
                  backgroundColor: Colors.blue, // สีของวงกลม
                ),
                const SizedBox(
                    width: 10), // เว้นระยะห่างระหว่างรูปโปรไฟล์และข้อความ
                // ชื่อและเวลาโพสต์
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "User Name",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "5 minutes ago",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20), // เพิ่มระยะห่างด้านล่าง
            // กล่องสำหรับรูปภาพหรือโพสต์
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 200, // ความสูงของกล่อง
              color: Colors.grey, // สีพื้นหลังของกล่อง
            ),
            const SizedBox(height: 20), // เพิ่มระยะห่างระหว่างกล่องและปุ่ม
            // แถวของปุ่ม (Like, Comment, Share)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Like"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Comment"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text("Share"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
