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
  final List<Map<String, String>> heaseItems = [
    {
      'title': 'Arduino Nano-ESP32',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'status': 'Active',
      'image': 'assets/images/Update_1.png',
    },
    {
      'title': 'Arduino Uno R4 - ESP32',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'image': 'assets/images/R4.webp',
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
      'status': 'Active',
      'duration': '1m 30sec',
      'image': 'assets/images/Update_1.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top Image with Slight Downward Shift
          Padding(
            padding: EdgeInsets.only(top: 70), // Moves image slightly down
            child: Container(
              width: 300, // Fixed width
              height: 150, // Fixed height
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), // Rounded corners
                border: Border.all(
                  color: Colors.black, // Black border
                  width: 2, // Border thickness
                ),
              ),
              child: ClipRRect(
                borderRadius:
                    BorderRadius.circular(18), // Ensures image is inside
                child: Image.asset(
                  'assets/images/Update_1.png', // Ensure this image exists in assets
                  width: 300,
                  height: 150,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          SizedBox(height: 10), // Adds space before list

          // Scrollable News List
          Expanded(
            child: ListView.builder(
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
                      image: DecorationImage(
                        image: AssetImage(news['image']!),
                        fit: BoxFit.cover, // Ensures the image is inside
                      ),
                    ),
                  ),
                  title: Text(news['title']!),
                  subtitle: Text('${news['date']} \u2022 ${news['duration']}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (status != null) // Show status only if it exists
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
          ),
        ],
      ),
    );
  }
}
