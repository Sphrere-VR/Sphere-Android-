/*
Author: Edward Phiri
Project: Sphere 
Date: N/A
TEch Master Event project

*/

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

  void _showDraggableSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Ensure full transparency
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(20)), // Rounded top
            border: Border.all(
              color: const Color.fromARGB(255, 0, 0, 0), // Black border
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.5,
              minChildSize: 0.25,
              maxChildSize: 0.75,
              builder: (context, scrollController) {
                return Container(
                  color: Colors.white, // Background
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width, // Full width
                            height: 150, // Slight height
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                              border: Border.all(
                                color: const Color.fromARGB(
                                    255, 0, 0, 0), // Red border
                                width: 2, // Border thickness
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  20), // Ensure border radius for the image
                              child: Image.asset(
                                'assets/images/A1-Version.png', // Change to your image path
                                width: MediaQuery.of(context)
                                    .size
                                    .width, // Full width
                                height: 150, // Slight height
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 0, // Adjust the top padding for spacing
                            bottom:
                                0, // Add bottom padding to reduce space between texts
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Align text to left and icons to right
                            crossAxisAlignment:
                                CrossAxisAlignment.center, // Center vertically
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'PM6', // Updated to PM6
                                    style: TextStyle(
                                      fontFamily: 'lucky',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          8), // Space between PM6 and @PM6 · Online now
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '@PM6 · ', // Grey text
                                          style: TextStyle(
                                            fontFamily: 'lucky',
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Online now', // Green text
                                          style: TextStyle(
                                            fontFamily: 'lucky',
                                            fontSize: 14,
                                            color: Colors.green, // Set to green
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.share),
                                    onPressed: () {
                                      // Add share functionality here
                                    },
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.add),
                                    onPressed: () {
                                      // Add add functionality here
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
// Space between row and next section
                        Divider(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                        // Add more content here
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discover",
                          style: TextStyle(
                            fontFamily: 'lucky',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "See more",
                          style: TextStyle(
                            fontFamily: 'lucky',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.blue, // Blue color for emphasis
                            decoration:
                                TextDecoration.underline, // Underline added
                            decorationColor:
                                Colors.blue, // Ensures underline is blue
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildImageWithBorder('assets/images/p1.jpg'),
                        SizedBox(width: 10),
                        _buildImageWithBorder('assets/images/p4.jpeg'),
                        SizedBox(width: 10),
                        _buildImageWithBorder('assets/images/p2.jpeg'),
                        SizedBox(width: 10),
                        _buildImageWithBorder('assets/images/p3.jpeg'),
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
                              color: Color.fromARGB(255, 255, 255, 255),
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
          Positioned(
            top: 40,
            left: 20,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(0), // No padding
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors
                        .greenAccent, // green background inside the circle
                    border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 2), // Reduced border width
                  ),
                  child: IconButton(
                    iconSize: 25, // Reduced icon size
                    constraints: BoxConstraints(
                      minWidth: 25, // Minimum width for the IconButton
                      minHeight: 20, // Minimum height for the IconButton
                    ),
                    icon: Icon(Icons.menu, color: Colors.black),
                    onPressed: () => _showDraggableSheet(context),
                  ),
                ),
                SizedBox(width: 10), // Space between the icons
                Container(
                  padding: EdgeInsets.all(0), // No padding
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors
                        .greenAccent, // green background inside the circle
                    border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        width: 2), // Reduced border width
                  ),
                  child: IconButton(
                    iconSize: 25, // Reduced icon size
                    constraints: BoxConstraints(
                      minWidth: 25, // Minimum width for the IconButton
                      minHeight: 25, // Minimum height for the IconButton
                    ),
                    icon: Icon(Icons.help_outline,
                        color: Colors.black), // New icon
                    onPressed: () {
                      // Add your onPressed functionality here
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(0), // No padding
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.greenAccent, // green background inside the circle
                border: Border.all(
                    color: const Color.fromARGB(255, 0, 0, 0),
                    width: 2), // Reduced border width
              ),
              child: IconButton(
                iconSize: 25, // Reduced icon size
                constraints: BoxConstraints(
                  minWidth: 25, // Minimum width for the IconButton
                  minHeight: 25, // Minimum height for the IconButton
                ),
                icon: Icon(Icons.notifications_none_outlined,
                    color: Colors.black), // Notification icon
                onPressed: () {
                  // Add your onPressed functionality here
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildImageWithBorder(String imagePath) {
  return Container(
    width: 50, // Adjust as needed
    height: 50, // Adjust as needed
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.black, width: 2), // Border color & width
    ),
    child: ClipOval(
      child: Image.asset(
        imagePath,
        width: 40, // Adjust image size within the border
        height: 40,
        fit: BoxFit.cover, // Ensures the image fits well
      ),
    ),
  );
}
