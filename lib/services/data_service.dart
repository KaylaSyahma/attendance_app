// mau masukin satu key yg nantinya ad di firebase kita

import 'package:cloud_firestore/cloud_firestore.dart';

class DataService {
  final CollectionReference dataCollection = FirebaseFirestore.instance.collection('attendance');

  
  Future<QuerySnapshot> getData(){
    // data masuk di firebase, lalu untuk menampilkan history kita get data
    return dataCollection.get();
  }

  // UNTUK DELETE
  Future<void> deleteData(String docid){
    // pengantar pemakaian data dri internet. doc dipake untuk otomatis nge get id
    return dataCollection.doc(docid).delete();
  }
}