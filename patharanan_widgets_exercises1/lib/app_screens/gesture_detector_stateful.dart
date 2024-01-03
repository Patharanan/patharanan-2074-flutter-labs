import 'package:flutter/material.dart';

class MyGestureDetector extends StatefulWidget {
  const MyGestureDetector({super.key});

  @override
  State<MyGestureDetector> createState() => _MyGestureDetectorState();
}

class _MyGestureDetectorState extends State<MyGestureDetector> {
  Color _color = Colors.blue;
  String _gestureText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _gestureText = "Tap";
            });
          },
          onDoubleTap: () {
            setState(() {
              _gestureText = "Double Tap";
            });
          },
          onLongPress: () {
            setState(() {
              _gestureText = "Long Press";
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: _color,
              height: 200.0,
              width: 200.0,
              child: Center(
                child: Text(
                  _gestureText,
                  style: TextStyle(fontSize: 20, color: Colors.black45),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          "Gesture performed: $_gestureText",
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
      ],
    );
  }
}
