import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx/home.dart';

import '../List.dart';
import '../Models/modelclass.dart';
import '../Models/modelclass.dart';
import '../Models/modelclass.dart';

class countingcontroller extends GetxController {
  final FirebaseFirestore db = FirebaseFirestore.instance;


  RxInt count = 0.obs;

  void increment() {
    count++;
  }

  void decrement() {
    count--;
  }

  TextEditingController nameController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  List<modelClass> detailsList=[];
  void adddetails(BuildContext context){
    print("gfxghcjhvhk");

    String id = DateTime.now().millisecondsSinceEpoch.toString();

    HashMap<String, Object> details = HashMap();
    details["NAME"] = nameController.text.toString();
    details["ADDRES"] = addressController.text.toString();


    db.collection("SUDENTS").doc(id).set(details);

    print(nameController.text.toString()+"gggggggg");
getDetails(context);
  }

  void getDetails(BuildContext context){
    print("bdhfbiv");
db.collection("SUDENTS").get().then((value) {
if (value.docs.isNotEmpty){
  print(value.docs.toString());
  detailsList.clear();
  for (var value in value.docs){
detailsList.add(modelClass(value.get("NAME"),value.get("ADDRES"),value.id));

  }
  print(detailsList.length.toString()+"aaaaaaaaaaaaaa");
  Navigator.push(context, MaterialPageRoute(builder: (context) =>list()));

}
});
    //Navigator.push(context, MaterialPageRoute(builder: (context) =>list()));
  }


}
