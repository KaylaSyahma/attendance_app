import 'package:attendance_app/services/data_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  State<AttendanceHistoryScreen> createState() => _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState extends State<AttendanceHistoryScreen> {
  final DataService dataService = DataService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance History"),
      ),
      body: StreamBuilder(
        // stream = untuk membungkus widget widget kita menjadi satu kesatuan. supaya widgte kita ter manage-well
        stream: dataService.dataCollection.snapshots(), //snapshot = untuk memberitahu ui bahwa data sudah siap di consume
        // builder = menggunakan karakteristik dri widget function
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text("There is no data"),
            );
          }

          final data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              // put attendance card UI here
            } ,
          );
        }
      ),
    );
  }
}