import 'package:get/get.dart';
import 'package:mangmantapp/model/orderapi.dart';

import 'package:http/http.dart';
import 'package:mangmantapp/view/recyclbin_page.dart';

class Employeecontroller extends GetxController {
  late Future<List<Order>> orders;
  @override
  void onInit() {
    super.onInit();
    orders = getOrder();

    update();
  }

  onprs(snap) async {
    await delete(Uri.parse(
        "https://employeemaser.onrender.com/api/order/deleteorder/${snap}"));
    print("tm");
    orders.runtimeType;
    update();
  }

  torecycl() {
    Get.to(() => RecyclbinPage());
  }
}
