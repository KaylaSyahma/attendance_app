import 'package:flutter/material.dart';

class SnackBarComponent {
  // static model -> untuk mempertahankan value dari function yg dipanggil
  // alasan pake static -> 
  static void showSnackBar(BuildContext context, String message, {bool isError = false}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          Icon(
            isError ? Icons.error_outline : Icons.check_circle_outline,
            color: Colors.white,
          ),
          SizedBox(width: 10,),
          Expanded(child: Text(message, style: TextStyle(color: Colors.white),))
        ],
      ),
      backgroundColor: isError ? Colors.red : Colors.blueGrey,
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    ));
  }
}