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
            AppBar(automaticallyImplyLeading: false,
                title: Text("List"), backgroundColor: Colors.blue.shade200),
        body: controller.detailsList.isNotEmpty
            ? ListView.builder(
                itemCount: controller.detailsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(decoration: BoxDecoration(color:     Colors.blue.shade200
                        ,borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        title: Text(controller.detailsList[index].name),
                        subtitle: Text(controller.detailsList[index].address),
                        trailing: SizedBox(width: 100,
                          child: Row(
                            children: [
                              IconButton(onPressed: () {
                                controller.editdetaails(controller.detailsList[index].id);
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>crud(from: "Edit",editid:controller.detailsList[index].id,)));


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
            : Center(
              child: Container(
                  color: Colors.grey,
                  height: 100,
                  width: 200,
          child: Center(child: Text("Add pls one")),
                ),
            ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // controller.adddetails(context);
        // controller.getDetails(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) =>crud(from: "New",editid: "",)));


      },child: Icon(Icons.add),),
//       floatingActionButton: FloatingActionButton(onPressed: () {
// controller.cleardetails();

//
//       },child: Text("add next"),),

    );
  }
}
