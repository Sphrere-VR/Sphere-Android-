import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InfoPage(),
    );
  }
}

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black),
        actions: [
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "It's Time to Play",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.emoji_events, color: Colors.orange),
                      Text("Rank"),
                      Text("120",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Column(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text("Points"),
                      Text("2,301",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            Image.asset('assets/images/toad.png', height: 120),
            SizedBox(height: 12),
            Text(
              "Badges",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              child: Text(
                "Badges are gotten when you reach a certain level. Win a Nintendo Badge today!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black54),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "Choose Your Players",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/player1.png', height: 60),
                SizedBox(width: 16),
                Image.asset('assets/images/player2.png', height: 60),
                SizedBox(width: 16),
                Image.asset('assets/images/player3.png', height: 60),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
