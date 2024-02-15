import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/List.dart';

import 'controller/controler.dart';

class crud extends StatelessWidget {
   crud({super.key});
  final countingcontroller controller = Get.put(countingcontroller());


  @override
  Widget build(BuildContext context) {
    return  Scaffold(backgroundColor: Colors.blue.shade200,
    body:

        Column(
          children: [
            SingleChildScrollView(
            child: Column(
            children: [
            SizedBox(
            height: 100,
            ),
            Text("Login", style: TextStyle(fontSize: 30, fontFamily: "font")),
    SizedBox(
    height: 80,
    ),
    Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Colors.white),
    child: TextFormField(
      controller: controller.nameController,
    style: TextStyle(fontWeight: FontWeight.bold),
    decoration: InputDecoration(
    contentPadding: EdgeInsets.symmetric(
    horizontal: 10, vertical: 10),
    border: InputBorder.none,
    labelText: "NAME",
    labelStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: "font")))),
    ])),

    SizedBox(height: 50,),

    Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: Colors.white),
    child: TextFormField(controller: controller.addressController,
    style: TextStyle(fontWeight: FontWeight.bold),
    decoration: InputDecoration(
    contentPadding: EdgeInsets.symmetric(
    horizontal: 10, vertical: 10),
    border: InputBorder.none,
    labelText: "ADDRESS",
    labelStyle: TextStyle(
    fontWeight: FontWeight.bold,
    fontFamily: "font")))),
    ]),
    floatingActionButton: FloatingActionButton(onPressed: () {
      controller.adddetails(context);
      controller.getDetails(context);


    },child: Icon(Icons.add),),
    );
  }
}
