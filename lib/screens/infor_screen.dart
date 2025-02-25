import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

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

class InforScreen extends StatefulWidget {
  @override
  _InforScreenState createState() => _InforScreenState();
}

class _InforScreenState extends State<InforScreen> {
  int shootsCount = 0;

  @override
  void initState() {
    super.initState();

    // Show the popup dialog
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showCountingDialog(130); // Example target count
    });
  }

  void _showCountingDialog(int targetCount) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CountingDialog(
          targetCount: targetCount,
          onCountComplete: (count) {
            setState(() {
              shootsCount = count;
            });
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 246, 185, 59),
                  Color.fromRGBO(105, 240, 174, 1).withOpacity(0.5),
                ],
              ),
            ),
          ),
          Positioned(
            top: 40, // Adjusted top position to drop the icon lower
            left: 16,
            child: IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                // Add your menu action here
              },
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "It's Time to Play",
                    style: TextStyle(
                      fontFamily: 'lucky',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 255, 255, 255),
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
                              "Shoots",
                              style: TextStyle(
                                color: Color.fromARGB(255, 246, 185, 59),
                                fontFamily: 'lucky',
                              ),
                            ),
                            Text(
                              "$shootsCount",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 246, 185, 59),
                                fontFamily: 'lucky',
                              ),
                            ),
                          ],
                        ),
                        CustomPaint(
                          size:
                              Size(3, 50), // Width and Height of the separator
                          painter: CurvedSeparatorPainter(),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: 80, // Reduced size
                              height: 80,
                              child:
                                  Image.asset('assets/images/EnemyAlien.png'),
                            ),
                            Text(
                              "Escaped",
                              style: TextStyle(
                                fontFamily: 'lucky',
                                color: Color.fromARGB(255, 246, 185, 59),
                              ),
                            ),
                            Text(
                              "2,301",
                              style: TextStyle(
                                fontFamily: 'lucky',
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 246, 185, 59),
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
                    style: TextStyle(
                      fontFamily: 'lucky',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    child: Text(
                      "Badges are gotten when you reach a certain level. Win a Nintendo Badge today!",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontFamily: 'lucky', color: Colors.black54),
                    ),
                  ),
                  SizedBox(height: 20), // Reduced spacing
                  Text(
                    "Choose Your Players",
                    style: TextStyle(
                      fontFamily: 'lucky',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(height: 10), // Reduced spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blue[100]!, Colors.blue[300]!],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
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
                            child: Image.asset('assets/images/appolo1.png',
                                height: 55),
                          ),
                          SizedBox(height: 8),
                          Stack(
                            children: [
                              // Border text
                              Text(
                                'Apollo',
                                style: TextStyle(
                                  fontFamily: 'lucky',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Solid text
                              Text(
                                'Apollo',
                                style: TextStyle(
                                  fontFamily: 'lucky',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 12),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blue[100]!, Colors.blue[300]!],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
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
                            child: Image.asset('assets/images/3TT1.png',
                                height: 55),
                          ),
                          SizedBox(height: 8),
                          Stack(
                            children: [
                              // Border text
                              Text(
                                '3TT1',
                                style: TextStyle(
                                  fontFamily: 'lucky',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Solid text
                              Text(
                                '3TT1',
                                style: TextStyle(
                                  fontFamily: 'lucky',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(width: 12),
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blue[100]!, Colors.blue[300]!],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
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
                            child: Image.asset('assets/images/junkBooster.png',
                                height: 55),
                          ),
                          SizedBox(height: 8),
                          Stack(
                            children: [
                              // Border text
                              Text(
                                'Booster',
                                style: TextStyle(
                                  fontFamily: 'lucky',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // Solid text
                              Text(
                                'Booster',
                                style: TextStyle(
                                  fontFamily: 'lucky',
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CountingDialog extends StatefulWidget {
  final int targetCount;
  final Function(int) onCountComplete;

  CountingDialog({required this.targetCount, required this.onCountComplete});

  @override
  _CountingDialogState createState() => _CountingDialogState();
}

class _CountingDialogState extends State<CountingDialog> {
  int count = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        count++;
        if (count >= widget.targetCount) {
          _timer?.cancel();
          widget.onCountComplete(count);
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Counting...'),
      content: Text('$count'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}
