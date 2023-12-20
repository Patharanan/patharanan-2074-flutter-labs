import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              // Background Image
              Image.network(
                'https://via.placeholder.com/350x150', // Replace with your actor/actress image URL
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              // Content
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 20), // Space before the first row
                  Text(
                    'มนต์แคน แก่นคูน',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20), // Space between name and contact info
                  Card(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    elevation: 4,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildContactInfo(
                              Icons.location_on, 'Actor/Actress Place'),
                          SizedBox(height: 10),
                          _buildContactInfo(Icons.phone, 'Actor/Actress Phone'),
                          SizedBox(height: 10),
                          _buildContactInfo(Icons.email, 'Actor/Actress Email'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 20), // Space between contact info and ratings
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStarIcon(Icons.star, Colors.green),
                      _buildStarIcon(Icons.star, Colors.green),
                      _buildStarIcon(Icons.star, Colors.green),
                      _buildStarIcon(Icons.star, Colors.black),
                      _buildStarIcon(Icons.star, Colors.black),
                    ],
                  ),
                  SizedBox(height: 20), // Space after the last row
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildStarIcon(IconData icon, Color color) {
    return Icon(
      icon,
      color: color,
      size: 40,
    );
  }
}
