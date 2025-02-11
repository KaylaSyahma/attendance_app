import 'package:attendance_app/services/data_service.dart';
import 'package:attendance_app/ui/history/components/attendance_card.dart';
import 'package:attendance_app/ui/history/components/delete_dialog.dart';
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
          // kalau misalkan snapshot gapunya data
          if (!snapshot.hasData) {
            return const Center(
              child: Text("There is no data"),
            );
          }
          // ini klo misal si snapshot ad datanya
          final data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return AttendanceHistoryCard(
                // untuk mendefinisikan data yang akan ditampilkan UI berdasarkan index/posisi yg ad di db
                data: data[index].data() as Map<String, dynamic>, 
                onDelete: () {
                  showDialog(
                    context: context, 
                    builder:(context) => DeleteDialog(
                      // untuk menjadikan index sebagai id dari data yang ad di db
                      documentId: data[index].id,
                      dataCollection: dataService.dataCollection,
                      // digunakan untuk memperbarui state ketika terjadi penghapusan data 
                      onConfirm: () {
                        // pake setstate krn pasti bakal ad perubahan
                        setState(() {
                          // dipanggil lagi index nya untuk memperbarui index
                          dataService.deleteData(data[index].id);
                          Navigator.pop(context);
                        });
                      },
                    )
                  );
                },
              );
            } ,
          );
        }
      ),
    );
  }
}