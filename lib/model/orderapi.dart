import 'dart:convert';
import 'package:http/http.dart' as http;

class Order {
  String customarname;
  String locationCar;
  String customarphone;
  String id;
  String local;
  String timeofserves;
  Order(
      {required this.timeofserves,
      required this.local,
      required this.id,
      required this.customarname,
      required this.customarphone,
      required this.locationCar});

  factory Order.fromJson(Map<String, dynamic> json) => Order(
      timeofserves: json["timeofserves"],
      local: json["local"],
      id: json["_id"],
      customarname: json["customarname"],
      customarphone: json["customarphone"],
      locationCar: json["locationCar"]);
}

Future<List<Order>> getOrder() async {
  deletorder() {}
  const String url = "https://employeemaser.onrender.com/api/order/getorder";
  final response = await http.get(Uri.parse(url));

  var jsonresponse = json.decode(response.body);
  List<Order> orders = [];
  for (var u in jsonresponse) {
    Order order = Order(
        local: u["local"],
        timeofserves: u["timeofserves"],
        id: u["_id"],
        customarname: u["customarname"],
        customarphone: u["customarphone"],
        locationCar: u["locationCar"]);
    orders.add(order);
  }
  return orders;
}
