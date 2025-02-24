import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.luckiestGuyTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: InforScreen(),
    );
  }
}

class InforScreen extends StatelessWidget {
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
              style: TextStyle(
                fontFamily: 'lucky',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.black,
                  width: 2,
                ),
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
                      SizedBox(
                        width: 100, // Increased size
                        height: 100,
                        child: Image.asset('assets/images/shoots.png'),
                      ),
                      Text(
                        "Your Shoots",
                        style: TextStyle(
                          fontFamily: 'lucky',
                        ),
                      ),
                      Text(
                        "120",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'lucky',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 60, // Increased separator height
                    width: 2, // Made the separator thicker
                    color: Colors.grey,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 100, // Increased size
                        height: 100,
                        child: Image.asset('assets/images/EnemyAlien.png'),
                      ),
                      Text(
                        "Escaped",
                        style: TextStyle(
                          fontFamily: 'lucky',
                        ),
                      ),
                      Text(
                        "2,301",
                        style: TextStyle(
                          fontFamily: 'lucky',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset('assets/images/alienAstroids.png', height: 220),
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
