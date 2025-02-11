import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DeleteDialog extends StatelessWidget {
  final String documentId;
  final CollectionReference dataCollection;
  const DeleteDialog({super.key, required this.documentId, required this.dataCollection, required Null Function() onConfirm});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Delete Data",
        style: TextStyle(fontSize: 18, color: Colors.black),
      ),
      content: const Text(
        "Are you sure want to delete this data?",
        style: TextStyle(fontSize: 14, color: Colors.black),
      ),
      // action = supaya user bisa melakukan yes/no
      actions: [
        TextButton(
          onPressed: (){
            // untuk berkomunikasi dengan database untuk melakukan penghapusan data dri db
            dataCollection.doc(documentId).delete();
            Navigator.pop(context);
          }, 
          child: const Text("Yes", style: TextStyle(fontSize: 14, color: Colors.black),)
        ),
        TextButton(
          child: Text("No", style: TextStyle(fontSize: 14, color: Colors.black),),
          onPressed: (){
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}