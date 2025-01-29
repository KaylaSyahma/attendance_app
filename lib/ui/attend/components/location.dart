import 'package:flutter/material.dart';

Padding buildLocationsection(bool isLoading, String address){
  return Padding(
    padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your location",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
        isLoading
        ? Center(
          child: CircularProgressIndicator(
            color: Colors.blueAccent,
          ),
        )
        : Padding(
          padding: EdgeInsets.all(10),
          child: SizedBox(
            // agar tingginya menjadi 120px, biar lebih variatif ceunah
            height: 5 * 24,
            child: TextField(
              enabled: false,
              maxLines: 5,
              decoration: InputDecoration(
                // 
                alignLabelWithHint: true,
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(Colors.blueAccent)
                ),
                hintText: address.isNotEmpty ? address : "Your location",
                hintStyle: TextStyle(
                  fontSize: 14, color: Colors.grey
                ),
                fillColor: Colors.transparent,
                filled: true
              ),
          )),
        )
      ],
    ),
  );
}