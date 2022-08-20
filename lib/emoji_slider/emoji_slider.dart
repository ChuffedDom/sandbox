import 'package:flutter/material.dart';

class EmojiSlider extends StatefulWidget {
  const EmojiSlider({Key? key}) : super(key: key);

  @override
  State<EmojiSlider> createState() => _EmojiSliderState();
}

class _EmojiSliderState extends State<EmojiSlider> {
  double _currentSliderValue = 5;
  var emojiScores = {
    0: "🤬",
    1: "😡",
    2: "😠",
    3: "😭",
    4: "😢",
    5: "😐",
    6: "🙂",
    7: "😊",
    8: "😄",
    9: "😁",
    10: "😍",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "emoji slider 😁",
        ),
      ),
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 700.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                emojiScores[_currentSliderValue].toString(),
                style: const TextStyle(fontSize: 50),
              ),
              const SizedBox(height: 20),
              Slider(
                  min: 0,
                  max: 10,
                  divisions: 10,
                  value: _currentSliderValue,
                  label: _currentSliderValue.round().toString(),
                  onChanged: (value) {
                    setState(() {
                      _currentSliderValue = value;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
