import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/controller/controler.dart';

class home extends StatelessWidget {
  home({super.key});
  final countingcontroller controller = Get.put(countingcontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                controller.decrement();
              },
              icon: Icon(Icons.arrow_back_ios),
              label: Text("decrement"),
            ),
            Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green.shade200,
                ),
                child: Center(
                    child: Obx(() => Text(
                          controller.count.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )))),
            ElevatedButton.icon(
              onPressed: () {
                controller.increment();
              },
              icon: Icon(Icons.arrow_forward_ios_rounded),
              label: Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}
