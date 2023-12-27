import 'package:flutter/material.dart';
import 'package:flutter_application_demo1/data_model/facultiesDataModel.dart';
import 'package:flutter_application_demo1/app_screens/faculty_detail.dart';

class FacultyListScreen extends StatelessWidget {
  final List<FacultyDataModel> faculties = [
    FacultyDataModel(
      title: 'Engineering',
      name: "วิศวกรรมศาสตร์",
      image:
          '/Users/path/Documents/patharanan-2074-flutter-labs/patharanan_widgets_exercises1/asset/en.jpg',
      url: 'https://www.en.kku.ac.th/web/',
    ),
    FacultyDataModel(
      title: 'Medicine',
      name: "แพทยศาสตร์",
      image:
          '/Users/path/Documents/patharanan-2074-flutter-labs/patharanan_widgets_exercises1/asset/med.jpg',
      url: 'https://md.kku.ac.th/',
    ),
    FacultyDataModel(
      title: 'Architecture',
      name: "สถาปัตยกรรมศาสตร์",
      image:
          '/Users/path/Documents/patharanan-2074-flutter-labs/patharanan_widgets_exercises1/asset/arch.jpeg',
      url: 'https://arch.kku.ac.th/web/',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KKU Faculties'),
        backgroundColor: Color.fromARGB(255, 203, 155, 22),
      ),
      body: ListView.builder(
        itemCount: faculties.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            leading: const Icon(Icons.arrow_right),
            title: Text(faculties[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      FacultyDetailScreen(facultyData: faculties[index]),
                ),
              );
            },
          ));
        },
      ),
    );
  }
}
