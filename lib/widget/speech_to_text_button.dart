import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import '../api/speech_api.dart';

class SpeechToTextButton extends StatefulWidget {
  String text;
  final Function(String) getTextCallBack;
  bool isListening;

  SpeechToTextButton(
      {super.key,
      required this.isListening,
      required this.text,
      required this.getTextCallBack});

  @override
  State<SpeechToTextButton> createState() => _SpeechToTextButtonState();
}

class _SpeechToTextButtonState extends State<SpeechToTextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          // child: Container(
          AvatarGlow(
        animate: widget.isListening,
        endRadius: 75,
        glowColor: Theme.of(context).primaryColor,
        child: FloatingActionButton(
          child:
              Icon(widget.isListening ? Icons.mic : Icons.mic_none, size: 36),
          onPressed: toggleRecording,
        ),
      ),
    );
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
        onResult: ((text) => widget.getTextCallBack(text)),
        onListening: (isListening) {
          setState(() => widget.isListening = widget.isListening);
        },
      );
}
