import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sphere_app/screens/infor_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isPressed = false;

  void _setPressed(bool isPressed) {
    setState(() {
      _isPressed = isPressed;
    });
  }

  void _navigateToGameScreen(BuildContext context) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => InforScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
      ),
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
// Positioned widget for top-left menu & profile icons
// Positioned widget for top-left menu, profile, notification, and help center icons
          Positioned(
            top: 50, // Adjust based on status bar height
            left: 20,
            right: 20, // Ensures alignment on both sides
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Aligns left & right icons
              children: [
                // Left Side: Menu & Profile Icons
                Row(
                  children: [
                    // Menu Icon
                    GestureDetector(
                      onTap: () {
                        print('Menu button pressed');
                        // Implement menu action here
                      },
                      child: Icon(
                        Icons.menu,
                        size: 30,
                        color: const Color.fromARGB(255, 95, 95, 95),
                      ),
                    ),
                    SizedBox(width: 10), // Space between icons

                    // Profile Icon with Border and Transparent Background
                    GestureDetector(
                      onTap: () {
                        print('Profile button pressed');
                        // Implement profile action here
                      },
                      child: Container(
                        width: 35, // Kept at 30 as requested
                        height: 35, // Kept at 30 as requested
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 3, // Border thickness
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/vr.webp', // Your profile image
                            fit: BoxFit
                                .cover, // Ensures the image fills the container
                            width: 25, // Matching container size
                            height: 25, // Matching container size
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Right Side: Notification & Help Center Icons
                Row(
                  children: [
                    // Notification Icon with Red Badge
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('Notification button pressed');
                            // Implement notification action here
                          },
                          child: Icon(
                            Icons.notifications,
                            size: 30,
                            color: const Color.fromARGB(255, 95, 95, 95),
                          ),
                        ),
                        // Red Dot for Notification Badge (Optional)
                        Positioned(
                          top: 2,
                          right: 2,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color:
                                  Colors.red, // Red badge for new notifications
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 15), // Space between icons

                    // Help Center Icon
                    GestureDetector(
                      onTap: () {
                        print('Help Center button pressed');
                        // Implement Help Center action here
                      },
                      child: Icon(
                        Icons.help_outline, // Help icon
                        size: 30,
                        color: const Color.fromARGB(255, 95, 95, 95),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Main Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/cover.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Card Container
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "It's time to",
                      style: TextStyle(
                        fontFamily: 'lucky',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Save the Galaxy!",
                      style: TextStyle(
                        fontFamily: 'lucky',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 246, 185, 59),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Join millions of players worldwide to win a race and compete in Mario Kart races.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'lucky',
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Play Button with Press Effect
                    GestureDetector(
                      onTapDown: (_) => _setPressed(true),
                      onTapUp: (_) {
                        _setPressed(false);
                        _navigateToGameScreen(context);
                      },
                      onTapCancel: () => _setPressed(false),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 100),
                        transform: _isPressed
                            ? Matrix4.translationValues(0, 5, 0)
                            : Matrix4.identity(),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Color.fromARGB(255, 12, 12, 12),
                              width: 2,
                            ),
                          ),
                          child: Text(
                            "PLAY NOW",
                            style: TextStyle(
                              fontFamily: 'lucky',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 246, 185, 59),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // "Made and Designed by EPJ" at Bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Made and Designed by ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('EPJ link tapped');
                    },
                    child: Text(
                      "Edward",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 12,
                        color: Colors.blue.withOpacity(0.5),
                      ),
                    ),
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
