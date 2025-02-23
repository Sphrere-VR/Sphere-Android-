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
        textTheme: GoogleFonts
            .luckiestGuyTextTheme(), // Set the Luckiest Guy font globally
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
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
                  Color.fromARGB(255, 246, 185, 59), // Gold color
                  Color.fromRGBO(105, 240, 174, 1)
                      .withOpacity(0.5), // Light green with opacity
                ],
              ),
            ),
          ),

          // Main Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Game Image
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

              // Card Container with Border
              Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: Colors.black,
                    width: 2, // Border thickness
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
                        fontFamily:
                            'lucky', // The family name you defined in pubspec.yaml
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Save the Galaxy !",
                      style: TextStyle(
                        fontFamily:
                            'lucky', // The family name you defined in pubspec.yaml
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
                        fontFamily:
                            'lucky', // The family name you defined in pubspec.yaml
                        fontSize: 15,
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    SizedBox(height: 20),

                    // Play Button Inside Card
                    GestureDetector(
                      onTap: () {
                        // Add your navigation action here
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color:
                                Color.fromARGB(255, 12, 12, 12), // Border color
                            width: 2, // Border thickness
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.greenAccent.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Text(
                          "PLAY NOW",
                          style: TextStyle(
                            fontFamily:
                                'lucky', // The family name you defined in pubspec.yaml
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 246, 185, 59),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
// "Made and Designed by EPJ" at Bottom with Grey Opacity Text
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 20), // Adjust bottom spacing
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Made and Designed by ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.5), // Grey opacity
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
                        color: Colors.blue
                            .withOpacity(0.5), // Grey opacity for the link
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
