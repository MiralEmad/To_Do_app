import 'package:flutter/material.dart';

import '../../../core/models/task_model.dart';
import '../../../core/theme/app_theme.dart';

class StatusBadge extends StatelessWidget {
  const StatusBadge({
    super.key,
    required this.status,
  });

  final TaskStatus status;

  @override
  Widget build(BuildContext context) {
    String text;
    Color color;

    switch (status) {
      case TaskStatus.pending:
        text = 'Pending';
        color = AppColors.orange;
        break;

      case TaskStatus.inProgress:
        text = 'In Progress';
        color = AppColors.blue;
        break;

      case TaskStatus.done:
        text = 'Done';
        color = AppColors.green;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}