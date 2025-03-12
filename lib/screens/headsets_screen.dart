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
  final List<Map<String, String>> boardsItems = [
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
  ];

  final List<Map<String, String>> bluetoothItems = [
    {
      'title': 'HC-05',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'status': 'Online',
      'image': 'assets/images/Update_1.png',
    },
    {
      'title': 'HC-06',
      'date': '21.05.2024',
      'duration': '1m 30sec',
      'status': 'Offline',
      'image': 'assets/images/Update_1.png',
    },
  ];

  String selectedImage = 'assets/images/Update_1.png';
  String selectedTitle = 'Arduino Nano-ESP32';
  String selectedDuration = '1m 30sec';
  String selectedStatus = 'Online';
  bool isSelectedOnline = true; // Track if the selected item is online

  void updateSelection(Map<String, String> item) {
    setState(() {
      selectedImage = item['image']!;
      selectedTitle = item['title']!;
      selectedDuration = item['duration']!;
      selectedStatus = item.containsKey('status') ? item['status']! : 'Pair';
      isSelectedOnline = selectedStatus == 'Online'; // Update the online status
    });
  }

  void _showBoardDetailsPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return BoardDetailsPopup(
          image: selectedImage,
          title: selectedTitle,
          duration: selectedDuration,
          status: selectedStatus,
        );
      },
    );
  }

  void _navigateToPlayScreen() {
    if (isSelectedOnline) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PlayScreen(
            image: selectedImage,
            title: selectedTitle,
            duration: selectedDuration,
            status: selectedStatus,
          ),
        ),
      );
    } else {
      print('Cannot play: Item is not online');
    }
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildListItem(Map<String, String> item) {
    final String? status = item['status'];
    final Color statusColor = (status == 'Online') ? Colors.green : Colors.grey;

    return ListTile(
      onTap: () => updateSelection(item),
      leading: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.black, width: 2),
          image: DecorationImage(
            image: AssetImage(item['image']!),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          item['title']!,
          style: TextStyle(
            fontFamily: 'lucky',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      subtitle: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '${item['date']} • ${item['duration']}',
          style: TextStyle(
            fontFamily: 'lucky',
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (status != null)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 3),
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
                  fontSize: 10,
                ),
              ),
            ),
          SizedBox(width: 8),
          Icon(Icons.more_vert),
        ],
      ),
    );
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
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: isSelectedOnline
                                    ? Colors.green
                                    : Colors.red, // Border color changes
                                width: 2,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.play_arrow, size: 20),
                              onPressed: _navigateToPlayScreen,
                            ),
                          ),
                          SizedBox(width: 8),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.connected_tv_sharp, size: 20),
                              onPressed: _showBoardDetailsPopup,
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
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                _buildSectionHeader('Microcontroller '),
                ListView.builder(
                  shrinkWrap: true,
                  physics:
                      NeverScrollableScrollPhysics(), // Disable scrolling for inner ListView
                  itemCount: boardsItems.length,
                  itemBuilder: (context, index) {
                    final board = boardsItems[index];
                    return _buildListItem(board);
                  },
                ),
                _buildSectionHeader('Bluetooth'),
                ListView.builder(
                  shrinkWrap: true,
                  physics:
                      NeverScrollableScrollPhysics(), // Disable scrolling for inner ListView
                  itemCount: bluetoothItems.length,
                  itemBuilder: (context, index) {
                    final bluetooth = bluetoothItems[index];
                    return _buildListItem(bluetooth);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BoardDetailsPopup extends StatelessWidget {
  final String image;
  final String title;
  final String duration;
  final String status;

  BoardDetailsPopup({
    required this.image,
    required this.title,
    required this.duration,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            width: 100,
            height: 100,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5),
          Text('Duration: $duration'),
          SizedBox(height: 5),
          Text('Status: $status'),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    );
  }
}

class PlayScreen extends StatelessWidget {
  final String image;
  final String title;
  final String duration;
  final String status;

  PlayScreen({
    required this.image,
    required this.title,
    required this.duration,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Play Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 150,
              height: 150,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Duration: $duration',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: status == 'Online' ? Colors.green : Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Icon(
              Icons.play_arrow,
              size: 100,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}
