import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HeadsetsScreen());
  }
}

class HeadsetsScreen extends StatelessWidget {
  final List<Map<String, String>> heaseItems = [
    {
      'title': 'Was passiert mit dem Bitcoin?',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'status': 'Active',
      'image': 'assets/images/Update_1.png',
    },
    {
      'title': 'VW: Milliarden Investitionen in Südafrika',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'image': 'assets/images/Update_1.png',
    },
    {
      'title': 'SPAC: Eine Analyse des Booms',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'image': 'assets/images/Update_1.png',
    },
    {
      'title': 'Ripple siegt vor Gericht',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'image': 'assets/images/Update_1.png',
    },
    {
      'title': 'Meta bringt Twitter-Konkurrenten an Start',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'image': 'assets/images/Update_1.png',
    },
    {
      'title': 'Dow Jones/Russell 2000',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'image': 'assets/images/Update_1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: heaseItems.length,
        itemBuilder: (context, index) {
          final news = heaseItems[index];
          final String? status = news['status'];
          final Color statusColor =
              (status == 'Active') ? Colors.green : Colors.grey;

          return ListTile(
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: ClipOval(
                child: Image.asset(news['image']!, fit: BoxFit.cover),
              ),
            ),
            title: Text(news['title']!),
            subtitle: Text('${news['date']} \u2022 ${news['duration']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (status != null) // Show status only if it exists
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      status,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                SizedBox(width: 8),
                Icon(Icons.more_vert),
              ],
            ),
          );
        },
      ),
    );
  }
}
