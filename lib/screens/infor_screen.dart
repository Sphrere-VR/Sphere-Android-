import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'package:confetti/confetti.dart'; // Add this import

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

// Define the CurvedSeparatorPainter class
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
  int escapedCount = 0;
  late ConfettiController _confettiController; // Add this line

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(
        duration: const Duration(seconds: 10)); // Add this line

    // Show the popup dialog
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showCountingDialog(130, 115); // Example target counts
    });
  }

  @override
  void dispose() {
    _confettiController.dispose(); // Add this line
    super.dispose();
  }

  void _showCountingDialog(int targetShoots, int targetEscaped) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CountingDialog(
          targetShoots: targetShoots,
          targetEscaped: targetEscaped,
          onCountComplete: (shoots, escaped) {
            setState(() {
              shootsCount = shoots;
              escapedCount = escaped;
            });
            _confettiController.play(); // Add this line
            Navigator.of(context).pop();
          },
        );
      },
    ).then((_) {
      // Show confetti from the bottom after the dialog is dismissed
      _confettiController.play();
    });
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
                              "$escapedCount",
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
          Align(
            alignment: Alignment.bottomCenter,
            child: ConfettiWidget(
              confettiController: _confettiController,
              blastDirection: -3.14 / 2, // Blast direction (upwards)
              emissionFrequency: 0.05, // How often it emits
              numberOfParticles: 20, // Number of particles
              gravity: 0.1, // Gravity of the particles
            ),
          ),
        ],
      ),
    );
  }
}

class CountingDialog extends StatefulWidget {
  final int targetShoots;
  final int targetEscaped;
  final Function(int, int) onCountComplete;

  CountingDialog({
    required this.targetShoots,
    required this.targetEscaped,
    required this.onCountComplete,
  });

  @override
  _CountingDialogState createState() => _CountingDialogState();
}

class _CountingDialogState extends State<CountingDialog> {
  int count = 0;
  int currentPage = 0;
  Timer? _timer;
  PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _startCounting(widget.targetShoots);
  }

  void _startCounting(int targetCount) {
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      // Faster counting
      setState(() {
        count++;
        if (count >= targetCount) {
          _timer?.cancel();
          if (currentPage == 0) {
            _pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
            currentPage++;
            count = 0;
            _startCounting(widget.targetEscaped);
          } else {
            widget.onCountComplete(widget.targetShoots, count);
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.black, width: 2), // Border color
        borderRadius: BorderRadius.circular(25), // Rounded corners
      ),
      child: Container(
        width: 150,
        height: 150,
        padding: EdgeInsets.all(6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromRGBO(105, 240, 174, 1).withOpacity(0.5),
              Color.fromRGBO(105, 240, 174, 1)
                  .withOpacity(0.5), // Uniform color
            ],
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: PageView(
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildPage('assets/images/shoots.png', 'Shoots'),
            _buildPage('assets/images/EnemyAlien.png', 'Escaped'),
          ],
        ),
      ),
    );
  }

  Widget _buildPage(String imagePath, String title) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 60, // Increased size
          height: 60, // Increased size
        ),
        Text(
          title,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black), // Text color for contrast
        ),
        Text(
          '$count',
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black), // Text color for visibility
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
