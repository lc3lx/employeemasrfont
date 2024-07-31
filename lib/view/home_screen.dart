import 'package:flutter/material.dart';

import 'package:mangmantapp/view/epmployee_page.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext contxet) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage("images/background.jpg"),
      )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: EdgeInsets.only(top: 130),
              child: const Text(
                "Welcome",
                style: TextStyle(
                    color: Color.fromARGB(255, 43, 199, 56),
                    inherit: false,
                    fontSize: 40),
              )),
          Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 173, 253),
                borderRadius: BorderRadius.circular(30),
              ),
              margin: EdgeInsets.only(bottom: 240),
              child: MaterialButton(
                  onPressed: () {
                    Navigator.of(contxet).pushReplacement(MaterialPageRoute(
                        builder: (contxet) => (EpmployeePage())));
                  },
                  child: const Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  )))
        ],
      ),
    );
  }
}
