import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

class InforScreen extends StatefulWidget {
  @override
  _InforScreenState createState() => _InforScreenState();
}

class _InforScreenState extends State<InforScreen>
    with TickerProviderStateMixin {
  int enemiesKilled = 0;
  int enemiesEscaped = 0;
  int targetEnemiesKilled = 0;
  int targetEnemiesEscaped = 0;
  bool countingEnemiesKilled = false;
  bool countingEnemiesEscaped = false;
  bool showRecentActivity = false;

  late AnimationController _statsController;
  late Animation<double> _statsAnimation;
  late AnimationController _recentActivityController;
  late Animation<Offset> _recentActivityAnimation;

  @override
  void initState() {
    super.initState();

    _statsController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            showRecentActivity = true;
          });
          _recentActivityController.forward();
        }
      });

    _statsAnimation = Tween<double>(begin: 0, end: -20).animate(
      CurvedAnimation(parent: _statsController, curve: Curves.easeInOut),
    );

    _recentActivityController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _recentActivityAnimation = Tween<Offset>(
      begin: Offset(0, -0.5),
      end: Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _recentActivityController,
      curve: Curves.easeOut,
    ));

    FirebaseFirestore.instance
        .collection('gameData')
        .doc('FOufRJlIsdWmArvU5mUd')
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        setState(() {
          targetEnemiesKilled = snapshot['enemiesKilled'] ?? 0;
          targetEnemiesEscaped = snapshot['enemiesEscaped'] ?? 0;
        });
        animateCounter();
      }
    });
  }

  void animateCounter() async {
    setState(() => countingEnemiesKilled = true);
    for (int i = 0; i <= targetEnemiesKilled; i++) {
      await Future.delayed(Duration(milliseconds: 80));
      setState(() {
        enemiesKilled = i;
      });
    }
    setState(() => countingEnemiesKilled = false);

    setState(() => countingEnemiesEscaped = true);
    for (int i = 0; i <= targetEnemiesEscaped; i++) {
      await Future.delayed(Duration(milliseconds: 80));
      setState(() {
        enemiesEscaped = i;
      });
    }
    setState(() => countingEnemiesEscaped = false);

    _statsController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30), // Reduced top space for title
            Center(
              child: Text(
                "Your Game",
                style: TextStyle(
                  fontFamily: 'lucky',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 246, 185, 59),
                ),
              ),
            ),
            SizedBox(height: 30), // Increased space between title and stats box
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // Keep alignment to top
                  children: [
                    AnimatedBuilder(
                      animation: _statsAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, _statsAnimation.value),
                          child: child,
                        );
                      },
                      child: _buildStatBox(),
                    ),
                    if (showRecentActivity)
                      Padding(
                        padding: EdgeInsets.only(
                            top: 5), // Minimized space for recent activity
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recent Activity",
                              style: TextStyle(
                                fontFamily: 'lucky',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SlideTransition(
                              position: _recentActivityAnimation,
                              child: _buildRecentActivity(),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatBox() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem("Enemies Killed", enemiesKilled,
              "assets/images/shoots.png", countingEnemiesKilled),
          _buildStatItem("Enemies Escaped", enemiesEscaped,
              "assets/images/EnemyAlien.png", countingEnemiesEscaped),
        ],
      ),
    );
  }

  Widget _buildStatItem(
      String label, int value, String imagePath, bool counting) {
    return Column(
      children: [
        // Create a round circle with a border for the image
        ClipOval(
          child: Container(
            width: 70, // Width of the circle
            height: 70, // Height of the circle
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255,
                  255), // Optional: background color for the circle
              shape: BoxShape.circle, // Ensures it's circular
              border: Border.all(
                color: const Color.fromARGB(255, 0, 0, 0), // Border color
                width: 2, // Border width
              ),
            ),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover, // Ensure the image fits within the circle
            ),
          ),
        ),
        SizedBox(height: 8), // Adds spacing between the image and text
        Text(
          label,
          style: TextStyle(
            color: Colors.black54,
            fontFamily: 'lucky',
            fontSize: 14,
          ),
        ),
        Text(
          "$value",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: counting ? 36 : 18,
            color: Color.fromARGB(255, 246, 185, 59),
            fontFamily: 'lucky',
          ),
        ),
      ],
    );
  }

  Widget _buildRecentActivity() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildActivityRow("Shoots: $enemiesKilled Escaped: $enemiesEscaped"),
          Divider(),
          _buildActivityRow("Yet to be worked on: "),
          Divider(),
          _buildActivityRow("Yet to be worked on: "),
          Divider(),
          _buildActivityRow("Yet to be worked on: "),
          Divider(),
          _buildActivityRow("Yet to be worked on: "),
        ],
      ),
    );
  }

  Widget _buildActivityRow(String activity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(Icons.account_circle,
              size: 20, color: Colors.black), // User Icon
          SizedBox(width: 8), // Spacing between icon and text
          Expanded(
            child: Text(
              activity,
              style: TextStyle(
                fontFamily: 'lucky',
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _statsController.dispose();
    _recentActivityController.dispose();
    super.dispose();
  }
}
