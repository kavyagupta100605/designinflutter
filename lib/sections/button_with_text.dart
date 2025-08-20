import 'package:flutter/material.dart';

class ButtonWithText extends StatelessWidget {
  final IconData icon;
  final String data;
  final Color color;
  const ButtonWithText({
    super.key,
    required this.icon,
    required this.data,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color),
        Text(data),
      ],
    );
  }
}
