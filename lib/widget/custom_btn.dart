
import 'package:flutter/material.dart';

import '../helper/global.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomBtn({super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return Align(
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: const StadiumBorder(),
              elevation: 0,
              backgroundColor: Colors.blue[700],
              textStyle:
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              minimumSize: Size(mq.width * .4, 50)),
          onPressed: onTap,
          child: Text(text)),
    );
  }
}