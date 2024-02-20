import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/crud.dart';

import 'controller/controler.dart';

class list extends StatelessWidget {
  list({super.key});
  final countingcontroller controller = Get.put(countingcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(title: Text("List"), backgroundColor: Colors.blue.shade200),
        body: controller.detailsList.isNotEmpty
            ? ListView.builder(
                itemCount: controller.detailsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      color: Colors.blue.shade200,
                      child: ListTile(
                        title: Text(controller.detailsList[index].name),
                        subtitle: Text(controller.detailsList[index].address),
                        trailing: SizedBox(width: 100,
                          child: Row(
                            children: [
                              IconButton(onPressed: () {

                              }, icon:Icon( Icons.edit)),

                              IconButton(onPressed: () {
                                controller.deletedetails(controller.detailsList[index].id, context);

                              }, icon:Icon( Icons.delete,color: Colors.red,)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              )
            : Container(
                color: Colors.black,
                height: 100,
                width: 100,
              ),
      floatingActionButton: FloatingActionButton(onPressed: () {
controller.cleardetails();
        Navigator.push(context, MaterialPageRoute(builder: (context) =>crud()));

      },child: Text("add next"),),

    );
  }
}
