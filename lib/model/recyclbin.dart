import 'dart:convert';
import 'package:http/http.dart' as http;

class Recyclbin {
  String customarname;
  String locationCar;
  String customarphone;
  String id;
  String local;
  String timeofserves;
  Recyclbin(
      {required this.timeofserves,
      required this.local,
      required this.id,
      required this.customarname,
      required this.customarphone,
      required this.locationCar});

  factory Recyclbin.fromJson(Map<String, dynamic> json) => Recyclbin(
      timeofserves: json["timeofserves"],
      local: json["local"],
      id: json["_id"],
      customarname: json["customarname"],
      customarphone: json["customarphone"],
      locationCar: json["locationCar"]);
}

Future<List<Recyclbin>> getrecylbin() async {
  const String url =
      "https://employeemaser.onrender.com/api/recyclbin/getorder";
  final response = await http.get(Uri.parse(url));

  var jsonresponse = json.decode(response.body);
  List<Recyclbin> recyclbin = [];
  for (var u in jsonresponse) {
    Recyclbin order = Recyclbin(
        local: u["local"],
        timeofserves: u["timeofserves"],
        id: u["_id"],
        customarname: u["customarname"],
        customarphone: u["customarphone"],
        locationCar: u["locationCar"]);
    recyclbin.add(order);
  }
  return recyclbin;
}
