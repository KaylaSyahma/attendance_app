import 'package:attendance_app/ui/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// an entry point for submitting the attendance report
final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

Future<void> submitReport(BuildContext context, String address, String name, String attendanceStatus, String timestamp) async{
  showLoaderDialog(context);
  dataCollection.add(
    {
      'Address' : address,
      'name' : name,
      'status' : attendanceStatus,
      'timestamp' : timestamp
    }
  ).then((result){
    Navigator.of(context).pop();
    try {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.white,
            ),
            SizedBox(width: 10,),
            Text("Attendance Submitted Successfully", style: TextStyle(color: Colors.white),)
          ],
        ),
        backgroundColor: Colors.orangeAccent,
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ));
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => const HomeScreen())
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar( SnackBar(
        content:  Row(
          children: [
            const Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
            const SizedBox(width: 10,),
            Expanded(
              child: Text("Oops, $e", style: const TextStyle(color: Colors.white),)
            )
          ],
        ),
        backgroundColor: Colors.blueAccent,
        shape: const StadiumBorder(),
        behavior: SnackBarBehavior.floating,
      ));
    }
    // untuk menampilkan error yang di trigger oleh sistem
  }).catchError((error) {
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(
      content: Row(
        children: [
          Icon(Icons.error_outline, color: Colors.white,),
          SizedBox(width: 10,),
          Expanded(
            child: Text(
              "Oops, $error",
              style: TextStyle(color: Colors.white,
            )
                    ,
          ))],
      ),
      backgroundColor: Colors.blueAccent,
      shape: StadiumBorder(),
      behavior: SnackBarBehavior.floating,
    ));
    Navigator.of(context).pop();
  });
}

void showLoaderDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    content: Row(
      children: [
        const CircularProgressIndicator(
          // ini yang basic loading yang muter muter itu
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text("Checking the Data.."),
        )
      ],
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return alert;
    }
  );
}
