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
        backgroundColor: Color.fromARGB(228, 75, 91, 21),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 50),
        child: Column(
          children: [
            Image.asset(
                "/Users/path/Documents/patharanan-2074-flutter-labs/patharanan_widgets_exercises/imge.jpg"),
            SizedBox(
              height: 100,
            ),
            Container(
              padding: EdgeInsets.all(20),
              decoration:
                  BoxDecoration(color: Color.fromARGB(229, 204, 255, 31)),
              child: Text(
                "Warren Buffett",
                style: TextStyle(fontSize: 40),
                selectionColor: Color.fromRGBO(152, 6, 6, 0.259),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
