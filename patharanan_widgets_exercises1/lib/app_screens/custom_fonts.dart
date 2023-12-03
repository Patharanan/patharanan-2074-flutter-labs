import 'package:flutter/material.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding:
            const EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
        color: Color.fromARGB(228, 75, 91, 21),
        child: Text(
          "ภัทรนันท์  ปาปะขัง",
          textDirection: TextDirection.ltr,
          style: TextStyle(
            decoration: TextDecoration.none,
            fontFamily: "Kanit",
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
    );
  }
}
