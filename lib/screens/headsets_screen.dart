import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HeadsetsScreen(),
    );
  }
}

class HeadsetsScreen extends StatelessWidget {
  final List<Map<String, String>> newsItems = [
    {
      'title': 'Was passiert mit dem Bitcoin?',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'image': 'assets/bitcoin.png',
    },
    {
      'title': 'VW: Milliarden Investitionen in Südafrika',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'image': 'assets/vw.png',
    },
    {
      'title': 'SPAC: Eine Analyse des Booms',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'image': 'assets/spac.png',
    },
    {
      'title': 'Ripple siegt vor Gericht',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'image': 'assets/ripple.png',
    },
    {
      'title': 'Meta bringt Twitter-Konkurrenten an Start',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'image': 'assets/meta.png',
    },
    {
      'title': 'Dow Jones/Russell 2000',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'image': 'assets/dowjones.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News Feed'),
      ),
      body: ListView.builder(
        itemCount: newsItems.length,
        itemBuilder: (context, index) {
          final news = newsItems[index];
          return ListTile(
            leading: Image.asset(news['image']!,
                width: 50, height: 50, fit: BoxFit.cover),
            title: Text(news['title']!),
            subtitle: Text('${news['date']} \u2022 ${news['duration']}'),
            trailing: Icon(Icons.more_vert),
          );
        },
      ),
    );
  }
}
