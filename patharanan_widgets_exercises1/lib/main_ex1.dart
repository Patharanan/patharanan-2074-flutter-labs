import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "First Title",
    home: FirstPage(),
  ));
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Favorite Quote",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 50),
        child: Column(
          children: [
            Image.asset(
                "/Users/path/Documents/patharanan-2074-flutter-labs/patharanan_widgets_exercises/imge.jpg"),
            SizedBox(
              height: 135,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Warren",
                  style: TextStyle(
                      fontSize: 40,
                      color: Color.fromRGBO(153, 200, 255, 0.847)),
                ),
                Text(
                  "Buffett",
                  style: TextStyle(
                      fontSize: 40,
                      color: Color.fromRGBO(153, 200, 255, 0.847)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
