import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sphere_app/screens/infor_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isPressed = false;

  Widget _buildCategoryIcon(IconData icon, Color color) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.2),
        border: Border.all(
          color: color,
          width: 2,
        ),
      ),
      child: Icon(
        icon,
        size: 30,
        color: color,
      ),
    );
  }

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

          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Menu button pressed');
                      },
                      child: Container(
                        padding: EdgeInsets.all(6), // Reduced padding
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors
                              .white, // White background inside the circle
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 2),
                        ),
                        child: Icon(
                          Icons.menu,
                          size: 24, // Reduced icon size
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    GestureDetector(
                      onTap: () {
                        print('Profile button pressed');
                      },
                      child: Container(
                        width: 32, // Reduced size
                        height: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors
                              .white, // White background inside the circle
                          border: Border.all(
                            color: Colors
                                .grey, // Matching the other icons' border color
                            width: 2, // Slightly thinner border for consistency
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/vr.webp',
                            fit: BoxFit.cover,
                            width: 28, // Adjusted to fit better
                            height: 28,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('Notification button pressed');
                          },
                          child: Container(
                            padding: EdgeInsets.all(6), // Reduced padding
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors
                                  .white, // White background inside the circle
                              border: Border.all(
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  width: 2),
                            ),
                            child: Icon(
                              Icons.notifications,
                              size: 24, // Reduced icon size
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 3,
                          right: 3,
                          child: Container(
                            width: 8, // Reduced indicator size
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 12), // Reduced spacing
                    GestureDetector(
                      onTap: () {
                        print('Help Center button pressed');
                      },
                      child: Container(
                        padding: EdgeInsets.all(6), // Reduced padding
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors
                              .white, // White background inside the circle
                          border: Border.all(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              width: 2),
                        ),
                        child: Icon(
                          Icons.help_outline,
                          size: 24, // Reduced icon size
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

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
                    Divider(
                      color: Colors.black,
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Discover games",
                      style: TextStyle(
                        fontFamily: 'lucky',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildCategoryIcon(Icons.pets, Colors.blue),
                        SizedBox(width: 10),
                        _buildCategoryIcon(Icons.pets, Colors.red),
                        SizedBox(width: 10),
                        _buildCategoryIcon(Icons.pets, Colors.grey),
                        SizedBox(width: 10),
                        _buildCategoryIcon(Icons.pets, Colors.orange),
                        SizedBox(width: 10),
                        _buildCategoryIcon(Icons.pets, Colors.green),
                      ],
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
        ],
      ),
    );
  }
}
