import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import '../api/speech_api.dart';

class SpeechToTextButton extends StatefulWidget {
  String text;
  final Function(String) getTextCallBack;

  SpeechToTextButton(
      {super.key, required this.text, required this.getTextCallBack});

  @override
  State<SpeechToTextButton> createState() => _SpeechToTextButtonState();
}

class _SpeechToTextButtonState extends State<SpeechToTextButton> {
  bool isListening = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          // child: Container(
          AvatarGlow(
        animate: isListening,
        endRadius: 75,
        glowColor: Theme.of(context).primaryColor,
        child: FloatingActionButton(
          child: Icon(isListening ? Icons.mic : Icons.mic_none, size: 36),
          onPressed: toggleRecording,
        ),
      ),
    );
  }

  Future<void>? toggleRecording() {
    setState(() => isListening = !isListening);
    SpeechApi.toggleRecording(
      onResult: ((text) => widget.getTextCallBack(text)),
      onListening: (isListening) {},
    );
  }
}
