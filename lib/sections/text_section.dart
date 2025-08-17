import 'package:flutter/material.dart';

class TextSection extends StatelessWidget {
  final String data;

  const TextSection({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}
