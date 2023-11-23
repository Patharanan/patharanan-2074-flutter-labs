import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "First Title",
    home: MyApp(),
  ));
}

class PetName extends StatelessWidget {
  final String name;
  const PetName(this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
          color: Color.fromARGB(228, 75, 91, 21),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            name,
            style: TextStyle(
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w400,
                fontSize: 15),
          ),
        ));
  }
}

Widget buildPetImage(String imagePath) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        imagePath,
        height: 100,
        width: 100,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Pet App",
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          backgroundColor: Color.fromARGB(228, 75, 91, 21),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 150), //ระหว่างtext,Img
                      PetName("Cat"),
                      SizedBox(
                        height: 50.0,
                        width: 70,
                      ),
                      PetName("Dog"),
                      SizedBox(
                        height: 50.0,
                        width: 70,
                      ),
                      PetName("Bird"),
                      SizedBox(
                        height: 50.0,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildPetImage(
                          "/Users/path/Documents/patharanan-2074-flutter-labs/patharanan_widgets_exercises1/img/cat.HEIC"),
                      buildPetImage(
                          "/Users/path/Documents/patharanan-2074-flutter-labs/patharanan_widgets_exercises1/img/dog.HEIC"),
                      buildPetImage(
                          "/Users/path/Documents/patharanan-2074-flutter-labs/patharanan_widgets_exercises1/img/bird.HEIC"),
                    ],
                  )
                ]),
          ),
        ));
  }
}
