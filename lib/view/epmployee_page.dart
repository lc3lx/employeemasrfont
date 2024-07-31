import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:mangmantapp/controller/employeecontroller.dart';

import 'package:mangmantapp/model/orderapi.dart';

class EpmployeePage extends StatelessWidget {
  final Employeecontroller controller = Get.put(Employeecontroller());
  gtdata() {
    return FutureBuilder<List<Order>>(
        future: controller.orders,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("hellw");
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 88, 220, 86),
                          borderRadius: BorderRadius.circular(30)),
                      child:
                          GetBuilder<Employeecontroller>(builder: (controller) {
                        return Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: ListTile(
                                leading: IconButton(
                                  icon: const Icon(
                                    Icons.done_outline,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  onPressed: () async {
                                    await controller
                                        .onprs(snapshot.data![index].id);
                                    Get.back();
                                    await Get.off(EpmployeePage());
                                  },
                                ),
                                title: Text(snapshot.data![index].locationCar),
                                subtitle:
                                    Text(snapshot.data![index].customarphone),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Text(snapshot.data![index].customarname),
                                    Text(snapshot.data![index].timeofserves)
                                  ],
                                )),
                            Expanded(
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                    size: 40,
                                  )),
                            )
                          ],
                        );
                      }));
                });
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return CircularProgressIndicator();
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gtdata();
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.recycling_outlined,
            size: 30,
            color: Colors.white,
          ),
          onPressed: () async {
            await controller.torecycl();
          },
        ),
        backgroundColor: Color.fromARGB(255, 43, 199, 56),
        centerTitle: true,
        title: const Text(
          "Employee page",
        ),
      ),
      body: gtdata(),
    );
  }
}
