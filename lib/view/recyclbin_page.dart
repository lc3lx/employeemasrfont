import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mangmantapp/controller/recyclbicontroller.dart';
import 'package:mangmantapp/model/recyclbin.dart';
import 'package:http/http.dart';

class RecyclbinPage extends StatelessWidget {
  final Recyclbicontroller controller = Get.put(Recyclbicontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 75, 173, 253),
        centerTitle: true,
        title: const Text(
          "RecyclBin page",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<Recyclbin>>(
            future: controller.recyclbin,
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
                          child: GetBuilder<Recyclbicontroller>(
                              builder: (controller) {
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
                                        await post(
                                            Uri.parse(
                                                "https://back-end-qkk0.onrender.com/api/order/sendorder"),
                                            body: {
                                              "customarname": snapshot
                                                  .data![index].customarname,
                                              "locationCar": snapshot
                                                  .data![index].locationCar,
                                              "customarphone": snapshot
                                                  .data![index].customarphone,
                                              "timeofserves": snapshot
                                                  .data![index].timeofserves,
                                              "local":
                                                  snapshot.data![index].local
                                            });

                                        print("tm");
                                      },
                                    ),
                                    title:
                                        Text(snapshot.data![index].locationCar),
                                    subtitle: Text(
                                        snapshot.data![index].customarphone),
                                  ),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Text(
                                            snapshot.data![index].customarname),
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
            }),
      ),
    );
  }
}
