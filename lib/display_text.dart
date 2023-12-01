import 'package:flutter/material.dart';
import 'package:flutter_pageview_text_share/app_data_text.dart';

class DisplayText extends StatelessWidget {
  final AppDataText appDataText;

  const DisplayText({super.key, required this.appDataText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Text(
          appDataText.text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}

