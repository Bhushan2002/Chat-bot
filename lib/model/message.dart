import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Message{
  final bool isUser;
  final String message;
  final DateTime date;
  Message({ required this.isUser, required this.message, required this.date});
}
class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;
  const Messages(
      {
        super.key,
        required this.isUser,
        required this.message,
        required this.date
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(vertical: 15).copyWith(
          left: isUser ? 100:10,
          right: isUser ? 10: 100
      ),
      decoration: BoxDecoration(
          color: isUser ? Theme.of(context).primaryColor : Theme.of(context).focusColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: isUser ? Radius.circular(10): Radius.zero,
              topRight: Radius.circular(10),
              bottomRight: isUser ? Radius.zero : Radius.circular(10)
          )
      ),
      child: isUser ? Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(fontSize: 16,color: isUser ? Colors.white: Colors.black),
          ),
          Text(
            date,
            style: TextStyle(fontSize: 10,color: isUser ? Colors.white: Colors.black,),
          )
        ],
      ) : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                message,
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.black
                ),
                speed: const Duration(milliseconds: 100),
              ),
            ],

            totalRepeatCount: 1,
            pause: const Duration(milliseconds: 0),
            displayFullTextOnTap: true,
            stopPauseOnTap: true,
          ),
          // Text(
          //   message,
          //   style: TextStyle(fontSize: 16,color: isUser ? Colors.white: Colors.black),
          // ),
          Text(
            date,
            style: TextStyle(fontSize: 10,color: isUser ? Colors.white: Colors.black,),
          )
        ],
      ),
    );
  }
}