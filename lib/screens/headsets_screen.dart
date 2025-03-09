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

class HeadsetsScreen extends StatefulWidget {
  @override
  _HeadsetsScreenState createState() => _HeadsetsScreenState();
}

class _HeadsetsScreenState extends State<HeadsetsScreen> {
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
      'title': 'TME-edu Board Wifi',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'image': 'assets/images/tme_edu_board.webp',
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

  String selectedImage = 'assets/images/Update_1.png';
  String selectedTitle = 'Arduino Nano-ESP32';
  String selectedDuration = '1m 30sec';
  String selectedStatus = 'Active';

  void updateSelection(Map<String, String> item) {
    setState(() {
      selectedImage = item['image']!;
      selectedTitle = item['title']!;
      selectedDuration = item['duration']!;
      selectedStatus =
          item.containsKey('status') ? item['status']! : 'Disconnected';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70),
            child: Column(
              children: [
                Container(
                  width: 300,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: Image.asset(
                      selectedImage,
                      width: 300,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedTitle,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Duration: $selectedDuration',
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey[700]),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: selectedStatus == 'Active'
                                      ? Colors.green
                                      : Colors.red,
                                  width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '$selectedStatus',
                              style: TextStyle(
                                fontSize: 14,
                                color: selectedStatus == 'Active'
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 2),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.add, size: 20),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: heaseItems.length,
              itemBuilder: (context, index) {
                final news = heaseItems[index];
                final String? status = news['status'];
                final Color statusColor =
                    (status == 'Active') ? Colors.green : Colors.grey;
                return ListTile(
                  onTap: () => updateSelection(news),
                  leading: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                      image: DecorationImage(
                        image: AssetImage(news['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  title: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(news['title']!),
                  ),
                  subtitle: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('${news['date']} • ${news['duration']}'),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (status != null)
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                          decoration: BoxDecoration(
                            color: statusColor,
                            border: Border.all(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            status,
                            style: TextStyle(color: Colors.white, fontSize: 10),
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
