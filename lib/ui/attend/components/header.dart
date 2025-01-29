import 'package:flutter/material.dart';

Container buildHeader() {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10)
      ),
      color: Colors.blueAccent
    ),
  child: Row(
    children: [
      SizedBox(width: 12,),
      Icon(Icons.face_retouching_natural_outlined, color: Colors.white,),
      SizedBox(width: 12,),
      Text("Please tak e a picture", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
    ],
  ),
  );
}