import 'package:flutter/material.dart';

class TitleSection extends StatelessWidget {
  final String name;
  final String location;
  final String data;
  final IconData icon;
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
    required this.data,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
              Text(location, style: TextStyle(color: Colors.grey.shade500)),
            ],
          ),
          Row(
            spacing: 4,
            children: [
              Icon(icon, color: Colors.red),
              Text(data),
            ],
          ),
        ],
      ),
    );
  }
}
