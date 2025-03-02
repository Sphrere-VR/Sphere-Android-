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
    with SingleTickerProviderStateMixin {
  int enemiesKilled = 0;
  int enemiesEscaped = 0;
  int targetEnemiesKilled = 0;
  int targetEnemiesEscaped = 0;
  bool countingEnemiesKilled = false;
  bool countingEnemiesEscaped = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween<double>(begin: 0, end: -200).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

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
      await Future.delayed(Duration(milliseconds: 100));
      setState(() {
        enemiesKilled = i;
      });
    }
    setState(() => countingEnemiesKilled = false);

    setState(() => countingEnemiesEscaped = true);
    for (int i = 0; i <= targetEnemiesEscaped; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      setState(() {
        enemiesEscaped = i;
      });
    }
    setState(() => countingEnemiesEscaped = false);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(0, _animation.value),
                child: child,
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(12),
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
                      Opacity(
                        opacity: countingEnemiesEscaped ? 0.5 : 1.0,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: Image.asset('assets/images/shoots.png'),
                            ),
                            Text(
                              "Enemies Killed",
                              style: TextStyle(
                                color: Color.fromARGB(255, 246, 185, 59),
                                fontFamily: 'lucky',
                              ),
                            ),
                            Text(
                              "$enemiesKilled",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 246, 185, 59),
                                fontFamily: 'lucky',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Opacity(
                        opacity: countingEnemiesKilled ? 0.5 : 1.0,
                        child: Column(
                          children: [
                            SizedBox(
                              width: 80,
                              height: 80,
                              child:
                                  Image.asset('assets/images/EnemyAlien.png'),
                            ),
                            Text(
                              "Enemies Escaped",
                              style: TextStyle(
                                fontFamily: 'lucky',
                                color: Color.fromARGB(255, 246, 185, 59),
                              ),
                            ),
                            Text(
                              "$enemiesEscaped",
                              style: TextStyle(
                                fontFamily: 'lucky',
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 246, 185, 59),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
