import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 147, 141, 132),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            if (constraints.maxWidth > 600) {
              return _buildWideScreenContainers();
            } else {
              return _buildPortraitContainer();
            }
          },
        ),
      ),
    );
  }

  Widget _buildWideScreenContainers() {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(height: 50),
        _buildStack("Monkaen Kaenkoon",
            "/Users/path/Documents/patharanan-2074-flutter-labs/patharanan_widgets_exercises1/asset/MonkaenKaenkoon.jpg"),
        SizedBox(height: 50),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            _buildCard(
                "Monkae's Place",
                "Yasothon, Thailand,35120",
                "Telephone",
                '091-419-2645',
                "E-mail",
                "MonkaenKaenkoon@official.com"),
            SizedBox(
              height: 50,
            ),
            Row(children: [
              _buildStarIcon(Icons.star, Color.fromARGB(255, 255, 0, 0)),
              _buildStarIcon(Icons.star, Color.fromARGB(255, 255, 0, 0)),
              _buildStarIcon(Icons.star, Color.fromARGB(255, 255, 0, 0)),
              _buildStarIcon(Icons.star, Color.fromARGB(255, 255, 0, 0)),
              _buildStarIcon(Icons.star, Colors.black),
            ])
          ],
        ),
        SizedBox(height: 45),
      ],
    ));
  }

  Widget _buildPortraitContainer() {
    return Scaffold(
        appBar: AppBar(title: Text("My Favorite Celeb")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 50),
            _buildStack("Monkaen Kaenkoon",
                "/Users/path/Documents/patharanan-2074-flutter-labs/patharanan_widgets_exercises1/asset/MonkaenKaenkoon.jpg"),
            SizedBox(height: 20),
            _buildCard(
                "Monkae's Place",
                "Yasothon, Thailand,35120",
                "Telephone",
                '091-419-2645',
                "E-mail",
                "MonkaenKaenkoon@official.com"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStarIcon(Icons.star, Color.fromARGB(255, 255, 0, 0)),
                _buildStarIcon(Icons.star, Color.fromARGB(255, 255, 0, 0)),
                _buildStarIcon(Icons.star, Color.fromARGB(255, 255, 0, 0)),
                _buildStarIcon(Icons.star, Color.fromARGB(255, 255, 0, 0)),
                _buildStarIcon(Icons.star, Colors.black),
              ],
            ),
            SizedBox(height: 45),
          ],
        ));
  }

  Widget _buildStack(String text, String image) {
    return Stack(
      alignment: const Alignment(0.4, 0.5),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(image),
          radius: 170,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget _buildContactInfo(IconData icon, String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: Colors.grey),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildCard(String title_address, String address, String title_tel,
      String tel, String title_email, String email) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildContactInfo(Icons.location_on, title_address, address),
            const Divider(),
            SizedBox(height: 20),
            _buildContactInfo(Icons.phone, title_tel, tel),
            const Divider(),
            SizedBox(height: 20),
            _buildContactInfo(Icons.email, title_email, email),
          ],
        ),
      ),
    );
  }

  Widget _buildStarIcon(IconData icon, Color color) {
    return Icon(
      icon,
      color: color,
      size: 25,
    );
  }
}
