import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final String name;
  final String position;
  final String email;
  final String phoneNumber;
  final String imageUrl;

  const Profile(
      {super.key,
      required this.name,
      required this.position,
      required this.email,
      required this.phoneNumber,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage('$imageUrl'),
          ),
          Text(
            '$name',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text(
            '$position',
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.email, size: 20, color: Colors.purple),
              SizedBox(width: 8),
              Text(
                '$email',
                style: TextStyle(fontSize: 16, color: Colors.black),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.phone, size: 20, color: Colors.purple),
              SizedBox(width: 8),
              Text(
                '$phoneNumber',
                style: TextStyle(fontSize: 16, color: Colors.black),
              )
            ],
          )
        ],
      ),
    );
  }
}
