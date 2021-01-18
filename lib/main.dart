import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'data.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playAudio(int index) {
    final audioPlayer = AudioCache();
    audioPlayer.play('note$index.wav');
  }

  Widget createFlatButtons(int songIndex, Color buttonColor) {
    return Expanded(
      child: FlatButton(
        color: buttonColor,
        onPressed: () {
          playAudio(songIndex);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buttonPropsList
                  .map(
                    (buttonProp) => createFlatButtons(
                      buttonProp['songIndex'],
                      buttonProp['color'],
                    ),
                  )
                  .toList()),
        ),
      ),
    );
  }
}
