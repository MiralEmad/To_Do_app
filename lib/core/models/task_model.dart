import 'package:flutter/material.dart';

enum TaskStatus {
  pending,
  inProgress,
  done,
}

class TaskItem {
  const TaskItem({
    required this.titleKey,
    required this.subtitleKey,
    required this.status,
    required this.color,
    required this.icon,
  });

  final String titleKey;
  final String subtitleKey;
  final TaskStatus status;
  final Color color;
  final IconData icon;
}