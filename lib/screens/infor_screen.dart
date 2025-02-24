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

//Cals function for the separater in the card between the Enemy and gun
class CurvedSeparatorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = size.width
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Path path = Path();
    path.moveTo(size.width / 2, 0);

    // Increased control point offsets for more bending effect
    path.quadraticBezierTo(
        size.width * 1.5, size.height / 3, size.width / 2, size.height / 2);

    path.quadraticBezierTo(
        -size.width * 0.5, 2 * size.height / 3, size.width / 2, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
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
              padding: EdgeInsets.all(12), // Reduced padding
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
                        width: 80, // Reduced size
                        height: 80,
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
                  CustomPaint(
                    size: Size(3, 50), // Width and Height of the separator
                    painter: CurvedSeparatorPainter(),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 80, // Reduced size
                        height: 80,
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
            Image.asset('assets/images/alienAstroids.png',
                height: 200), // Reduced height slightly
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
            SizedBox(height: 20), // Reduced spacing
            Text(
              "Choose Your Players",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10), // Reduced spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/player1.png',
                    height: 55), // Slightly smaller
                SizedBox(width: 12),
                Image.asset('assets/images/player2.png', height: 55),
                SizedBox(width: 12),
                Image.asset('assets/images/player3.png', height: 55),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
