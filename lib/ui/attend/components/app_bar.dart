import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.blueAccent,
    leading: IconButton(
      onPressed: () => Navigator.of(context).pop(), 
      icon: Icon(Icons.arrow_back_ios, color: Colors.white,)
    ),
    title: Text("Attendance Menu", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
  );
}