import 'package:flutter/material.dart';

class PlayScreen extends StatelessWidget {
  final String image;
  final String title;
  final String duration;
  final String status;

  const PlayScreen({
    Key? key,
    required this.image,
    required this.title,
    required this.duration,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'lucky', // Apply the lucky font family
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Text(
                          'Duration: $duration',
                          style: TextStyle(
                            fontFamily: 'lucky', // Apply the lucky font family
                            fontSize: 14,
                            color: Colors.grey[700],
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color:
                                status == 'Online' ? Colors.green : Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            status,
                            style: const TextStyle(
                              fontFamily:
                                  'lucky', // Apply the lucky font family
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0), width: 2),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      image,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Image with red dots overlay
            Stack(
              children: [
                Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/TME_Edu_Rav2.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),

                // Red dot positioned at Arduino MCU board image
                Positioned(
                  top: 130,
                  left: 60,
                  child: _buildRedDot(),
                ),
                // Red dot positioned at LCD display image
                Positioned(
                  top: 200,
                  left: 20,
                  child: _buildRedDot(),
                ),
                // Red dot positioned at LED1 image
                Positioned(
                  top: 290,
                  left: 23,
                  child: _buildRedDot(),
                ),
                // Red dot positioned at RGB2 image
                Positioned(
                  top: 290,
                  left: 52,
                  child: GestureDetector(
                    onTap: () {
                      // Perform action when the dot is clicked
                      print("Red dot clicked!");
                    },
                    child: _buildRedDot(),
                  ),
                ),
                // Red dot positioned at RGB2 image
                Positioned(
                  top: 290,
                  left: 52,
                  child: _buildRedDot(),
                ),
                // Red dot positioned at OLED image
                Positioned(
                  top: 290,
                  left: 123,
                  child: _buildRedDot(),
                ),
                // Red dot positioned to the right SW on the image
                Positioned(
                  top: 247,
                  right: 72,
                  child: _buildRedDot(),
                ),
                // Red dot positioned to the mid SW on the image
                Positioned(
                  top: 247,
                  right: 103,
                  child: _buildRedDot(),
                ),
                // Red dot positioned to the left SW on the image
                Positioned(
                  top: 247,
                  right: 133,
                  child: _buildRedDot(),
                ),
                // Red dot positioned to the down SW on the image
                Positioned(
                  top: 277,
                  right: 103,
                  child: _buildRedDot(),
                ),
                // Red dot positioned to the up SW on the image
                Positioned(
                  top: 218,
                  right: 102,
                  child: _buildRedDot(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRedDot() {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }
}
