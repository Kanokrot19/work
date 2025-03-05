import 'package:flutter/material.dart';
// import 'package:flutterprojects/my_stateful_wiedget.dart';
// import 'package:flutterprojects/page_ansewr/answer_portal.dart';
// import 'package:flutterprojects/page_ansewr/answer1.dart';
// import 'package:flutterprojects/page_ansewr/answer2.dart';
// import 'package:flutterprojects/page_ansewr/answer3.dart';
// import 'package:flutterprojects/page_ansewr/answer4.dart';
//import 'package:flutterprojects/form_simple.dart';
//import 'package:flutterprojects/page_ansewr/registrationform.dart';
//import 'package:flutterprojects/page_ansewr/simple_api_call.dart';
//import 'package:flutterprojects/page_ansewr/air_quality.dart';
import 'package:flutterprojects/page_ansewr/api_product.dart';
import 'package:flutterprojects/model/product_data.dart';
import 'package:flutterprojects/page_ansewr/edit_product.dart';
import 'package:flutterprojects/page_ansewr/add_product.dart';
import 'package:flutterprojects/page_ansewr/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutterprojects/page_ansewr/profile.dart';
import 'package:flutterprojects/page_ansewr/traffic_light.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SU Mobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: TrafficLight(),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile Card")),
      body: Center(
        child: Container(
          height: 250,
          width: 400,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 10,
                spreadRadius: 2,
                offset: const Offset(4, 4),
              ),
            ],
          ),
          child: Profile(
            name: "Kanokrot Kitsakonpukdee",
            position: "IT",
            email: "kitsakonpukdee_k@silpakorn.edu",
            phoneNumber: "0910792816",
            imageUrl:
                "https://th.bing.com/th/id/R.4f25a5c437a7cd52817a4f13a484b4a5?rik=kBzmMqJZqz7Gmw&riu=http%3a%2f%2fs1.bwallpapers.com%2fwallpapers%2f2013%2f12%2f26%2fgolden-retriever-puppy_061645.jpg&ehk=4%2f0qrVKTHKXiGYaKzJcaiSJ4WVd8XyoxZbpP%2fCZnCUo%3d&risl=&pid=ImgRaw&r=0",
          ),
        ),
      ),
    );
  }
}