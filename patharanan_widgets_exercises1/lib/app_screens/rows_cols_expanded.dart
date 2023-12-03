import 'package:flutter/material.dart';

class RowsColsExpanded extends StatelessWidget {
  final String name;
  final String id;
  final String imageURL;
  final String photoCredit;

  const RowsColsExpanded({
    Key? key,
    required this.name,
    required this.id,
    required this.imageURL,
    required this.photoCredit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 154, 23, 23),
        ),
        child: Padding(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildNameAndIdRow(),
              SizedBox(height: 50.0),
              _buildImageRow(),
              SizedBox(height: 50.0),
              _buildPhotoCreditRow(),
              SizedBox(height: 50.0),
              _buildButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameAndIdRow() {
    return Row(
      children: [
        Expanded(
          child: Text(
            name,
            style: TextStyle(
                fontSize: 22.0,
                color: const Color.fromARGB(255, 173, 198, 210),
                fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(width: 30.0),
        Expanded(
          child: Text(
            id,
            style: TextStyle(
                fontSize: 22.0,
                color: const Color.fromARGB(255, 173, 198, 210),
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  Widget _buildImageRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Image.asset(
              "asset/imge.JPG",
              height: 300.0,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhotoCreditRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            photoCredit,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22.0,
                color: const Color.fromARGB(255, 173, 198, 210),
                fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  @override
  Widget _buildButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(fontSize: 30),
          foregroundColor: Color.fromARGB(255, 173, 198, 210),
          backgroundColor: Color.fromARGB(255, 2, 1, 1),
          side: const BorderSide(
              color: Color.fromARGB(255, 173, 198, 210), width: 2)),
      onPressed: () {
        print("Button Pressed");
      },
      child: const Text("Submit"),
    );
  }
}
