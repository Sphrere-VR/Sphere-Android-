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
      'status': 'Online',
      'image': 'assets/images/Update_1.png',
    },
    {
      'title': 'Arduino Uno R4 - ESP32',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'image': 'assets/images/R4.webp',
    },
    {
      'title': 'TME-edu Wifi Board',
      'date': '21.05.2024',
      'duration': '12m 30sec',
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
      'status': 'Online',
      'duration': '1m 30sec',
      'image': 'assets/images/Update_1.png',
    },
  ];

  String selectedImage = 'assets/images/Update_1.png';
  String selectedTitle = 'Arduino Nano-ESP32';
  String selectedDuration = '1m 30sec';
  String selectedStatus = 'Online';

  void updateSelection(Map<String, String> item) {
    setState(() {
      selectedImage = item['image']!;
      selectedTitle = item['title']!;
      selectedDuration = item['duration']!;
      selectedStatus = item.containsKey('status') ? item['status']! : 'Pair';
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
                                fontFamily: 'lucky',
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Duration: $selectedDuration',
                            style: TextStyle(
                                fontFamily: 'lucky',
                                fontSize: 16,
                                color: Colors.grey[700]),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 6, vertical: 3),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: selectedStatus == 'Online'
                                      ? Colors.green
                                      : Colors.red,
                                  width: 2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '$selectedStatus',
                                  style: TextStyle(
                                    fontFamily: 'lucky',
                                    fontSize: 14,
                                    color: selectedStatus == 'Online'
                                        ? Colors.green
                                        : Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
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
                    (status == 'Online') ? Colors.green : Colors.grey;
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
                    child: Text(
                      news['title']!,
                      style: TextStyle(
                        fontFamily: 'lucky',
                        fontSize: 20, // Adjust as needed
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // Adjust color if needed
                      ),
                    ),
                  ),
                  subtitle: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${news['date']} • ${news['duration']}',
                      style: TextStyle(
                        fontFamily: 'lucky',
                        fontSize: 16, // Slightly smaller for subtitle
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700], // Softer color for subtitle
                      ),
                    ),
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
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'lucky',
                                fontSize: 10),
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
