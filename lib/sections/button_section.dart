import 'package:flutter/material.dart';
import 'package:flutter_application_1/button_with_text.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonWithText(
          icon: Icons.call,
          data: 'CALL',
          color: Colors.deepPurple,
        ),
        ButtonWithText(
          icon: Icons.near_me,
          data: 'ROUTE',
          color: Colors.deepPurple,
        ),
        ButtonWithText(
          icon: Icons.share,
          data: 'SHARE',
          color: Colors.deepPurple,
        ),
      ],
    );
  }
}
