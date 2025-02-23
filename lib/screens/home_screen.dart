import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sphere App',
      theme: ThemeData(
        // Set a default font to see if it applies
        textTheme: GoogleFonts.creepsterTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Creepster Font Test",
          style: GoogleFonts.creepster(), // Apply the font here
        ),
      ),
      body: Center(
          child: Text(
        "Hi Cecilia",
        style: TextStyle(
          fontFamily: 'lucky', // The family name you defined in pubspec.yaml
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
