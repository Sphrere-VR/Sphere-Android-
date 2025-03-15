import 'package:flutter/material.dart';

// Data model for components
class Component {
  final String title;
  final String image;
  final String description;

  Component({
    required this.title,
    required this.image,
    required this.description,
  });
}

// Map of components with their details
final Map<String, Component> components = {
  'Arduino MCU Board': Component(
    title: 'Arduino MCU Board',
    image: 'assets/images/R4.webp',
    description:
        'The Arduino MCU Board is the main microcontroller unit that controls all the components on the TME education Board.',
  ),
  'LCD Display': Component(
    title: 'LCD Display',
    image: 'assets/images/LCD.png',
    description:
        'The LCD Display is used to show text and information to the user.',
  ),
  'LED1': Component(
    title: 'LED1',
    image: 'assets/images/LED.png',
    description: 'LED1 is a light-emitting diode used for visual indicators.',
  ),
  'RGB2': Component(
    title: 'RGB2',
    image: 'assets/images/RGB.png',
    description:
        'RGB2 is a multi-color LED that can display a range of colors.',
  ),
  'OLED': Component(
    title: 'OLED',
    image: 'assets/images/OLED.png',
    description:
        'The OLED display is a high-resolution screen for detailed graphics.',
  ),
  'Right SW': Component(
    title: 'Right SW',
    image: 'assets/images/SW1.png',
    description:
        'Push Button Switch is widely used as a standard input button on electronic projects. These work best when you mount it on PCB but can also be used on a solderless breadboard for temporary connections in prototypes. The pins are normally open (disconnected) and when the button is pressed they are momentarily closed and complete the circuit.',
  ),
  'Mid SW': Component(
    title: 'Mid SW',
    image: 'assets/images/SW1.png',
    description:
        'Push Button Switch is widely used as a standard input button on electronic projects. These work best when you mount it on PCB but can also be used on a solderless breadboard for temporary connections in prototypes. The pins are normally open (disconnected) and when the button is pressed they are momentarily closed and complete the circuit.',
  ),
  'Left SW': Component(
    title: 'Left SW',
    image: 'assets/images/SW1.png',
    description:
        'Push Button Switch is widely used as a standard input button on electronic projects. These work best when you mount it on PCB but can also be used on a solderless breadboard for temporary connections in prototypes. The pins are normally open (disconnected) and when the button is pressed they are momentarily closed and complete the circuit.',
  ),
  'Down SW': Component(
    title: 'Down SW',
    image: 'assets/images/SW1.png',
    description:
        'Push Button Switch is widely used as a standard input button on electronic projects. These work best when you mount it on PCB but can also be used on a solderless breadboard for temporary connections in prototypes. The pins are normally open (disconnected) and when the button is pressed they are momentarily closed and complete the circuit.',
  ),
  'Up SW': Component(
    title: 'Up SW',
    image: 'assets/images/SW1.png',
    description:
        'Push Button Switch is widely used as a standard input button on electronic projects. These work best when you mount it on PCB but can also be used on a solderless breadboard for temporary connections in prototypes. The pins are normally open (disconnected) and when the button is pressed they are momentarily closed and complete the circuit.',
  ),
};

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
                    border: Border.all(color: Colors.black, width: 2),
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

                // Red dots for each component
                Positioned(
                  top: 130,
                  left: 60,
                  child: GestureDetector(
                    onTap: () =>
                        _showDraggableSheet(context, 'Arduino MCU Board'),
                    child: _buildRedDot(),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 20,
                  child: GestureDetector(
                    onTap: () => _showDraggableSheet(context, 'LCD Display'),
                    child: _buildRedDot(),
                  ),
                ),
                Positioned(
                  top: 290,
                  left: 23,
                  child: GestureDetector(
                    onTap: () => _showDraggableSheet(context, 'LED1'),
                    child: _buildRedDot(),
                  ),
                ),
                Positioned(
                  top: 290,
                  left: 52,
                  child: GestureDetector(
                    onTap: () => _showDraggableSheet(context, 'RGB2'),
                    child: _buildRedDot(),
                  ),
                ),
                Positioned(
                  top: 290,
                  left: 123,
                  child: GestureDetector(
                    onTap: () => _showDraggableSheet(context, 'OLED'),
                    child: _buildRedDot(),
                  ),
                ),
                Positioned(
                  top: 247,
                  right: 72,
                  child: GestureDetector(
                    onTap: () => _showDraggableSheet(context, 'Right SW'),
                    child: _buildRedDot(),
                  ),
                ),
                Positioned(
                  top: 247,
                  right: 103,
                  child: GestureDetector(
                    onTap: () => _showDraggableSheet(context, 'Mid SW'),
                    child: _buildRedDot(),
                  ),
                ),
                Positioned(
                  top: 247,
                  right: 133,
                  child: GestureDetector(
                    onTap: () => _showDraggableSheet(context, 'Left SW'),
                    child: _buildRedDot(),
                  ),
                ),
                Positioned(
                  top: 277,
                  right: 103,
                  child: GestureDetector(
                    onTap: () => _showDraggableSheet(context, 'Down SW'),
                    child: _buildRedDot(),
                  ),
                ),
                Positioned(
                  top: 218,
                  right: 102,
                  child: GestureDetector(
                    onTap: () => _showDraggableSheet(context, 'Up SW'),
                    child: _buildRedDot(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Red dot widget
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

// Draggable bottom sheet
void _showDraggableSheet(BuildContext context, String selectedItem) {
  final component = components[selectedItem]; // Get the component details

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          border: Border.all(
            color: Colors.black,
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
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
// PM6, Online now, and play icon
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'PM6',
                                  style: TextStyle(
                                    fontFamily: 'lucky',
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '@PM6 · ',
                                        style: TextStyle(
                                          fontFamily: 'lucky',
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Online now',
                                        style: TextStyle(
                                          fontFamily: 'lucky',
                                          fontSize: 14,
                                          color: Colors.green,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // Play icon with circular border and InkWell
                            InkWell(
                              onTap: () {
                                // Handle click event
                                print("Play button clicked");
                                _showLCDPopup(context);
                              },
                              borderRadius: BorderRadius.circular(
                                  20), // Circular ripple effect
                              child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Image of the selected component
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              component!.image,
                              width: MediaQuery.of(context).size.width,
                              height: 150,
                              //fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Title of the selected component
                      Text(
                        component.title,
                        style: TextStyle(
                          fontFamily: 'lucky',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      // Description of the selected component
                      Text(
                        component.description,
                        style: TextStyle(
                          fontFamily: 'lucky',
                          fontSize: 16,
                          color: Colors.grey[700],
                        ),
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

void _showLCDPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent, // Remove background dimming
    builder: (context) {
      return Dialog(
        backgroundColor: Colors.transparent, // Remove default background color
        child: Center(
          // Center the popup content
          child: LCD16x2Display(
            line1: 'Hello, Flutter!',
            line2: 'This is LCD Demo!',
          ),
        ),
      );
    },
  );
}

class LCD16x2Display extends StatelessWidget {
  final String line1; // Text for the first line
  final String line2; // Text for the second line

  const LCD16x2Display({
    Key? key,
    required this.line1,
    required this.line2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (16 * 18.0) + (16 * 2), // Adjusted width to account for margins
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.blue[900], // LCD background color
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            MainAxisAlignment.center, // Vertically center the content
        crossAxisAlignment:
            CrossAxisAlignment.center, // Horizontally center the content
        children: [
          _buildLCDLine(context, line1.padRight(16).substring(0, 16)),
          SizedBox(height: 5),
          _buildLCDLine(context, line2.padRight(16).substring(0, 16)),
        ],
      ),
    );
  }

  Widget _buildLCDLine(BuildContext context, String text) {
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center, // Horizontally center the text
      children: List.generate(16, (index) {
        return Container(
          width: 14, // Width of each character block
          height: 20, // Height of each character block
          margin: EdgeInsets.symmetric(horizontal: 1), // Space between blocks
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3), // Block background
            borderRadius: BorderRadius.circular(4),
          ),
          alignment: Alignment.center,
          child: Text(
            text[index],
            style: TextStyle(
              color: Colors.white, // Text color
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      }),
    );
  }
}
