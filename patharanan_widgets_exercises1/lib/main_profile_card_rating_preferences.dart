import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            return _buildContainer(constraints.maxWidth);
          },
        ),
      ),
    );
  }

  Widget _buildContainer(double maxWidth) {
    if (maxWidth > 600) {
      return _buildWideScreenContainers();
    } else {
      return _buildPortraitContainer();
    }
  }

  Widget _buildWideScreenContainers() {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 70),
          ContactImageWidget(
            imagePath: "asset/MonkaenKaenkoon.JPG",
            text: "Monkaen Kaenkoon",
          ),
          SizedBox(height: 70),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 70),
                ContactCardWidget(
                  titleAddress: "Monkae's Place",
                  address: "Yasothon, Thailand,35120",
                  titleTel: "Telephone",
                  tel: '091-419-2645',
                  titleEmail: "E-mail",
                  email: "MonkaenKaenkoon@official.com",
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: RatingScreen(),
                ),
              ],
            ),
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 30),
          ContactImageWidget(
            imagePath: "asset/MonkaenKaenkoon.JPG",
            text: "Monkaen Kaenkoon",
          ),
          SizedBox(height: 70),
          ContactCardWidget(
            titleAddress: "Monkae's Place",
            address: "Yasothon, Thailand,35120",
            titleTel: "Telephone",
            tel: '091-419-2645',
            titleEmail: "E-mail",
            email: "MonkaenKaenkoon@official.com",
          ),
          SizedBox(height: 20),
          Expanded(
            child: RatingScreen(),
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

class RatingBloc extends ChangeNotifier {
  int _rating = 0;

  int get rating => _rating;

  void setRating(int value) {
    _rating = value;
    notifyListeners();
  }
}

RatingBloc ratingBloc = RatingBloc();

class RatingScreen extends StatefulWidget {
  @override
  RatingScreenState createState() => RatingScreenState();
}

class RatingScreenState extends State<RatingScreen> {
  late int _rating;

  @override
  void initState() {
    super.initState();
    _rating = ratingBloc.rating;
    _loadRating();
  }

  Future<void> _loadRating() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int storedRating = prefs.getInt('rating') ?? 0;
    ratingBloc.setRating(storedRating);
  }

  Widget _buildStar(int starIndex) {
    return IconButton(
      icon: Icon(
        Icons.star,
        color: starIndex < _rating ? Colors.black : Colors.grey,
      ),
      onPressed: () {
        setState(() {
          _rating = starIndex + 1;
          ratingBloc.setRating(_rating);
        });
        _saveRating();
      },
    );
  }

  Future<void> _saveRating() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('rating', _rating);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(5, (index) => _buildStar(index)),
      ),
    ));
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
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactInfoWidget(
              icon: Icons.location_on,
              title: titleAddress,
              subtitle: address,
            ),
            const Divider(),
            ContactInfoWidget(
              icon: Icons.phone,
              title: titleTel,
              subtitle: tel,
            ),
            const Divider(),
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
