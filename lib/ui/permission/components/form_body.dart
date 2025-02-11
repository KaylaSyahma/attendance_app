import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormBody extends StatelessWidget {
  const FormBody({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final formController = TextEditingController();
    final toController = TextEditingController();
    String dropValueCategories = "Please choose :";
    var categoriesList = <String>[
      "Please choose : ",
      "Sick",
      "IDN Teaching",
      "Others"
    ];

    return  Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            // texinputaction.next = jadi klo pencet tab dia beralih ke text input selanjutnya
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            controller: nameController,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              labelText: "Your Name",
              labelStyle: const TextStyle(color: Colors.black, fontSize: 14),
              // ini untuk yang ga active 
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blueAccent)
              ),
              // ini untuk yang active
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.blueAccent)
              ),
              hintText: "Please enter your name",
              hintStyle: const TextStyle(fontSize: 14, color: Colors.grey)
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
            child: Text(
              "Description",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blueAccent, style: BorderStyle.solid, width: 1)
            ),
            // manggil si dropdown
            child: DropdownButton(
              dropdownColor: Colors.white,
              value: dropValueCategories,
              onChanged: (value) {
                dropValueCategories = value.toString();
              },
              // item = buat kita mau nampilin apa
              items: categoriesList.map((value) {
                return DropdownMenuItem(
                  value: value.toString(),
                  child: Text(
                    value.toString(),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black
                    ),
                  ),
                );
              // method tolist berfungsi untuk mengkonversi sebuah data acak menjadi berurutan pada list
              }).toList() , 
              icon: const Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              underline: Container(
                height: 2,
                color: Colors.blueGrey,
              ),
              isExpanded: true,
            ),
          ),
           Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text("From", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                      Expanded(
                        child: TextField(
                          readOnly: true,
                          onTap: () async {
                            // ini bikin variabel. pake asyn proses krn showdatepicker adlh sebuah future
                            DateTime?  pickedDate = await showDatePicker(
                              context: context, 
                              initialDate: DateTime.now(), 
                              firstDate: DateTime(2025),
                              lastDate: DateTime(2025)
                            );
                            if (pickedDate != null) {
                              // untuk mengonversikan data detail tgl yg diambil dri picker date menjadi format dd/mm/yy
                              formController.text = DateFormat('dd/mm/yy').format(pickedDate);
                            }
                          },
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black
                          ),
                          controller: formController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(8),
                            hintText: "Starting From",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey
                            )
                          ),
                        )
                      ),
                      SizedBox(width: 14,),
                      Expanded(
                        child: Row(
                          children: [
                            Text("Until", style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),),
                            Expanded(
                              child: TextField(
                                readOnly: true,
                                onTap: () async {
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context, 
                                    initialDate: DateTime.now(), 
                                    // firstdate dan lastdate tuh kayak kalender yg akan aktif
                                    firstDate: DateTime(2025),
                                    lastDate: DateTime(2030)
                                  );
                                  if (pickedDate != null) {
                                    toController.text = DateFormat('dd/mm/yy').format(pickedDate);
                                  }
                                },
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black
                                ),
                                controller: toController,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(8),
                                  hintText: "Until",
                                  hintStyle: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey
                                  )
                                ),
                              )
                            )
                          ],
                        )
                      )
                    ],
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}