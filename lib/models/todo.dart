import 'package:flutter/material.dart';

enum Priority {
  urgent(color: Colors.red, title: 'Urgent'),
  high(color: Colors.orange, title: 'High'),
  medium(color: Colors.amber, title: 'Medium'),
  low(color: Colors.green, title: 'Low');

  const Priority({required this.color, required this.title});

  final Color color;
  final String title;
}

class ToDo {
  final String title;
  final String description;
  final Priority priority;

  const ToDo({
    required this.title,
    required this.description,
    required this.priority,
  });
}
