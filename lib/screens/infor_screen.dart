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

class _InforScreenState extends State<InforScreen> {
  int enemiesKilled = 0;
  int enemiesEscaped = 0;
  int targetEnemiesKilled = 0;
  int targetEnemiesEscaped = 0;

  @override
  void initState() {
    super.initState();
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
    for (int i = 0; i <= targetEnemiesKilled; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      setState(() {
        enemiesKilled = i;
      });
    }
    for (int i = 0; i <= targetEnemiesEscaped; i++) {
      await Future.delayed(Duration(milliseconds: 100));
      setState(() {
        enemiesEscaped = i;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
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
                    Column(
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
                    Column(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.asset('assets/images/EnemyAlien.png'),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
