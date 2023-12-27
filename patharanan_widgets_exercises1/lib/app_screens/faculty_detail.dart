import 'package:flutter/material.dart';
import 'package:flutter_application_demo1/data_model/facultiesDataModel.dart';

class FacultyDetailScreen extends StatelessWidget {
  final FacultyDataModel facultyData;
  FacultyDetailScreen({Key? key, required this.facultyData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(facultyData.title),
          backgroundColor: Color.fromARGB(255, 203, 155, 22)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(50),
              child: Text(
                facultyData.url,
                textAlign: TextAlign.center,
                style: TextStyle(
                  background: Paint()
                    ..color = Color.fromARGB(255, 203, 155, 22)
                    ..strokeWidth = 35
                    ..strokeJoin = StrokeJoin.round
                    ..strokeCap = StrokeCap.round
                    ..style = PaintingStyle.stroke,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            facultyData.name,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                color: Color.fromARGB(255, 37, 37, 37),
                fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Image.asset(
              facultyData.image,
              height: 500,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
