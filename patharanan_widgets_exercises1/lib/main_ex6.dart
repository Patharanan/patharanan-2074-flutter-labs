import 'package:flutter/material.dart';
import "./app_screens/rows_cols_expanded.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: RowsColsExpanded(
          name: 'Patharanan',
          id: '643040207-4',
          imageURL: 'assets/imge.JPG',
          photoCredit: 'Photo Credit:  EN Photo Club',
        ),
      ),
    );
  }
}
