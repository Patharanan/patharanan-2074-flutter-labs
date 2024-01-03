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
          ContactImageWidget(
            imagePath:
                "/Users/path/Documents/patharanan-2074-flutter-labs/patharanan_widgets_exercises1/asset/MonkaenKaenkoon.jpg",
            text: "Monkaen Kaenkoon",
          ),
          SizedBox(height: 50),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              ContactCardWidget(
                titleAddress: "Monkae's Place",
                address: "Yasothon, Thailand,35120",
                titleTel: "Telephone",
                tel: '091-419-2645',
                titleEmail: "E-mail",
                email: "MonkaenKaenkoon@official.com",
              ),
              SizedBox(height: 50),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RatingStarWidget(
                    icon: Icons.star,
                    defaultColor: Color.fromARGB(255, 255, 0, 0),
                  ),
                  RatingStarWidget(
                    icon: Icons.star,
                    defaultColor: Color.fromARGB(255, 255, 0, 0),
                  ),
                  RatingStarWidget(
                    icon: Icons.star,
                    defaultColor: Color.fromARGB(255, 255, 0, 0),
                  ),
                  RatingStarWidget(
                    icon: Icons.star,
                    defaultColor: Color.fromARGB(255, 255, 0, 0),
                  ),
                  RatingStarWidget(
                    icon: Icons.star,
                    defaultColor: Color.fromARGB(255, 255, 0, 0),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 45),
        ],
      ),
    );
  }

  Widget _buildPortraitContainer() {
    return Scaffold(
      appBar: AppBar(title: Text("My Favorite Celeb")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 50),
          ContactImageWidget(
            imagePath:
                "/Users/path/Documents/patharanan-2074-flutter-labs/patharanan_widgets_exercises1/asset/MonkaenKaenkoon.jpg",
            text: "Monkaen Kaenkoon",
          ),
          SizedBox(height: 20),
          ContactCardWidget(
            titleAddress: "Monkae's Place",
            address: "Yasothon, Thailand,35120",
            titleTel: "Telephone",
            tel: '091-419-2645',
            titleEmail: "E-mail",
            email: "MonkaenKaenkoon@official.com",
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RatingStarWidget(
                icon: Icons.star,
                defaultColor: Color.fromARGB(255, 255, 0, 0),
              ),
              RatingStarWidget(
                icon: Icons.star,
                defaultColor: Color.fromARGB(255, 255, 0, 0),
              ),
              RatingStarWidget(
                icon: Icons.star,
                defaultColor: Color.fromARGB(255, 255, 0, 0),
              ),
              RatingStarWidget(
                icon: Icons.star,
                defaultColor: Color.fromARGB(255, 255, 0, 0),
              ),
              RatingStarWidget(
                icon: Icons.star,
                defaultColor: Color.fromARGB(255, 255, 0, 0),
              ),
            ],
          ),
          SizedBox(height: 45),
        ],
      ),
    );
  }
}

class ContactImageWidget extends StatelessWidget {
  final String imagePath;
  final String text;

  ContactImageWidget({required this.imagePath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: const Alignment(0.4, 0.5),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(imagePath),
          radius: 170,
        ),
        Container(
          decoration: const BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class ContactInfoWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  ContactInfoWidget({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
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
}

class RatingStarWidget extends StatefulWidget {
  final IconData icon;
  final Color defaultColor;

  RatingStarWidget({required this.icon, required this.defaultColor});

  @override
  _RatingStarWidgetState createState() => _RatingStarWidgetState();
}

class _RatingStarWidgetState extends State<RatingStarWidget> {
  late bool isStarClicked;
  late Color starColor;

  @override
  void initState() {
    super.initState();
    isStarClicked = false;
    starColor = widget.defaultColor;
  }

  void toggleStarColor() {
    setState(() {
      isStarClicked = !isStarClicked;
      starColor =
          isStarClicked ? Color.fromARGB(255, 0, 0, 0) : widget.defaultColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toggleStarColor();
      },
      child: Icon(
        widget.icon,
        color: starColor,
        size: 25,
      ),
    );
  }
}

class ContactCardWidget extends StatelessWidget {
  final String titleAddress;
  final String address;
  final String titleTel;
  final String tel;
  final String titleEmail;
  final String email;

  ContactCardWidget({
    required this.titleAddress,
    required this.address,
    required this.titleTel,
    required this.tel,
    required this.titleEmail,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      elevation: 4,
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactInfoWidget(
              icon: Icons.location_on,
              title: titleAddress,
              subtitle: address,
            ),
            const Divider(),
            SizedBox(height: 20),
            ContactInfoWidget(
              icon: Icons.phone,
              title: titleTel,
              subtitle: tel,
            ),
            const Divider(),
            SizedBox(height: 20),
            ContactInfoWidget(
              icon: Icons.email,
              title: titleEmail,
              subtitle: email,
            ),
          ],
        ),
      ),
    );
  }
}
