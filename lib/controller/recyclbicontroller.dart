import 'package:get/get.dart';

import 'package:mangmantapp/model/recyclbin.dart';
import 'package:http/http.dart';

class Recyclbicontroller extends GetxController {
  late Future<List<Recyclbin>> recyclbin;
  @override
  void onInit() {
    super.onInit();
    recyclbin = getrecylbin();
    update();
  }

  onprs(snap) {
    delete(Uri.parse(
        "https://employeemaser.onrender.com/api/recyclbin/deleteorder/${snap}"));

    update();
  }
}
