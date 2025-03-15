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
                        fontFamily: 'lucky',
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
                            fontFamily: 'lucky',
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
                              fontFamily: 'lucky',
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
                  child: GestureDetector(
                    onTap: () {
                      _showDraggableSheet(context);
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRedDot() {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
    );
  }

  void _showDraggableSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Ensure full transparency
      builder: (context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white, // White background
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(20)), // Rounded top
            border: Border.all(
              color: const Color.fromARGB(255, 0, 0, 0), // Black border
              width: 2,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.5,
              minChildSize: 0.25,
              maxChildSize: 0.75,
              builder: (context, scrollController) {
                return Container(
                  color: Colors.white, // Background
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width:
                                MediaQuery.of(context).size.width, // Full width
                            height: 150, // Slight height
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(20), // Rounded corners
                              border: Border.all(
                                color: const Color.fromARGB(
                                    255, 0, 0, 0), // Red border
                                width: 2, // Border thickness
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  20), // Ensure border radius for the image
                              child: Image.asset(
                                'assets/images/A1-Version.png', // Change to your image path
                                width: MediaQuery.of(context)
                                    .size
                                    .width, // Full width
                                height: 150, // Slight height
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 10, // Adjust the top padding for spacing
                            bottom:
                                10, // Add bottom padding to reduce space between texts
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .spaceBetween, // Align text to left and icons to right
                            crossAxisAlignment:
                                CrossAxisAlignment.center, // Center vertically
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'PM6', // Updated to PM6
                                    style: TextStyle(
                                      fontFamily: 'lucky',
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          8), // Space between PM6 and @PM6 · Online now
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '@PM6 · ', // Grey text
                                          style: TextStyle(
                                            fontFamily: 'lucky',
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Online now', // Green text
                                          style: TextStyle(
                                            fontFamily: 'lucky',
                                            fontSize: 14,
                                            color: Colors.green, // Set to green
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // Space between row and next section
                        Divider(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          thickness: 1,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
