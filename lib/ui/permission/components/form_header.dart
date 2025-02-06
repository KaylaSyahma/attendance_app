import 'package:flutter/material.dart';

class FormHeader extends StatelessWidget{
    final String title;
    // klo misalkan kita mau pake icon dari icon material flutter
    final IconData icon;

  FormHeader({required this.title, required this.icon});
  
  @override
  Widget build(BuildContext context) {
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
          Icon(icon, color: Colors.white,),
          SizedBox(width: 12,),
          Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),)
        ],
      ),
    );
  }


}