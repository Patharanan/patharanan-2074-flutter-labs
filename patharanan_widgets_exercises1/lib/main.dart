import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'File IO Example',
      home: FileIOExample(),
    );
  }
}

class FileIOExample extends StatefulWidget {
  @override
  _FileIOExampleState createState() => _FileIOExampleState();
}

class _FileIOExampleState extends State<FileIOExample> {
  TextEditingController _dataController = TextEditingController();
  String _filePath = '';

  @override
  void initState() {
    super.initState();
    _getFilePath(); // Initialize file path when the widget initializes
  }

  Future<void> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    setState(() {
      _filePath = '${directory.path}/data.txt';
    });
  }

  Future<void> _writeToFile(String data) async {
    File file = File(_filePath);
    await file.writeAsString(data);
  }

  Future<String> _readFromFile() async {
    try {
      File file = File(_filePath);
      String fileContent = await file.readAsString();
      return fileContent;
    } catch (e) {
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('File IO Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _dataController,
              decoration: InputDecoration(labelText: 'Enter Data'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String data = _dataController.text;
                await _writeToFile(data);
                if (data.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Data written to file'),
                      duration: Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {},
                      ),
                    ),
                  );
                } else {
                  SnackBar(
                    content: Text('Data not written to file'),
                    duration: Duration(seconds: 3),
                    action: SnackBarAction(
                      label: 'OK',
                      onPressed: () {},
                    ),
                  );
                }
              },
              child: Text('Write to File'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String fileData = await _readFromFile(); // Read data from file
                if (fileData.isNotEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Data read from file $fileData'),
                      duration: Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {},
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('File is empty'),
                      duration: Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'OK',
                        onPressed: () {
                          // Do something when OK is pressed
                        },
                      ),
                    ),
                  );
                }
              },
              child: Text('Read from File'),
            ),
          ],
        ),
      ),
    );
  }
}
