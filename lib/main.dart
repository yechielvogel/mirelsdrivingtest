import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Messages',
      home: MessageScreen(),
    );
  }
}

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final List<Map<String, dynamic>> messages = [
    {
      'text': 'Hi Mirel, good morning! Tap here to continue.',
      'color': Colors.blue
    },
    {'text': 'Tap again', 'color': Colors.green},
    {'text': 'Thanks and again', 'color': Colors.orange},
    {'text': 'lovely you get how this works', 'color': Colors.purple},
    {'text': 'Anyway I am sure your in a rush..', 'color': Colors.red},
    {'text': 'So I wont keep you long', 'color': Colors.teal},
    {'text': 'Drive well', 'color': Colors.yellow},
    {'text': 'Remember those red light things ', 'color': Colors.pink},
    {'text': "They're not a suggestion", 'color': Colors.indigo},
    {'text': 'Anyway', 'color': Colors.cyan},
    {'text': 'Just thought I would wish you', 'color': Colors.lime},
    {'text': 'Allot of hatzlacha', 'color': Colors.amber},
    {'text': 'Have a good one', 'color': Colors.deepOrange},
    {'text': 'Thats it', 'color': Colors.brown},
    {'text': 'Why are you still here?', 'color': Colors.lightBlue},
    {'text': '👀', 'color': Colors.lightGreen},
    {'text': 'Ok I am really done', 'color': Colors.deepPurple},
    {'text': 'Happy tuesday', 'color': Colors.grey},
    {'text': '_', 'color': Colors.blueAccent},
    {'text': 'Lol', 'color': Colors.pinkAccent},
  ];

  int currentIndex = 0;

  void _nextMessage() {
    setState(() {
      currentIndex = (currentIndex + 1) % messages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        color: messages[currentIndex]['color'],
        child: Center(
          child: GestureDetector(
            onTap: _nextMessage,
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              transitionBuilder: (child, animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Text(
                messages[currentIndex]['text'],
                key: ValueKey<int>(currentIndex),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
