import 'package:flutter/material.dart';

class ImageSection extends StatelessWidget {
  final Image image;
  const ImageSection({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.circular(1), child: image);
  }
}
