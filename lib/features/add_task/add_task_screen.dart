import 'package:flutter/material.dart';
import '../../core/l10n/app_localization.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/responsive.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _titleController =
      TextEditingController();

  final TextEditingController _descController =
      TextEditingController();

  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  // 0 = Pending
  // 1 = In Progress
  // 2 = Done
  int _statusIndex = 0;

  Color _selectedColor = AppColors.blue;

  final List<Color> _colorOptions = [
    AppColors.blue,
    AppColors.green,
    AppColors.orange,
    AppColors.purple,
    AppColors.red,
    AppColors.teal,
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descController.dispose();
    super.dispose();
  }

  void _save(AppLocalizations t) {
    if (_formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(t.taskSaved),
          backgroundColor: AppColors.primary,
        ),
      );

      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations t =
        AppLocalizations.of(context);

    final List<String> statusOptions = [
      t.statusPending,
      t.statusInProgress,
      t.statusDone,
    ];

    final String currentStatus =
        statusOptions[_statusIndex];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          t.addTask,
          style: TextStyle(
            fontSize: context.sp(20),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),

      body: SafeArea(
        child: ResponsiveCenter(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              context.hPadding,
              0, // قللنا المسافة بعد Add Task
              context.hPadding,
              24,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.stretch,
                children: [
                  // =========================
                  // Task Title
                  // =========================

                  _FieldLabel(
                    text: t.taskTitle,
                  ),

                  SizedBox(
                    height: context.sp(8),
                  ),

                  TextFormField(
                    controller: _titleController,
                    textInputAction:
                        TextInputAction.next,
                    decoration: InputDecoration(
                      hintText: t.taskTitleHint,
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.trim().isEmpty) {
                        return t.nameRequired;
                      }

                      return null;
                    },
                  ),

                  SizedBox(
                    height: context.sp(20),
                  ),

                  // =========================
                  // Description
                  // =========================

                  _FieldLabel(
                    text: t.description,
                  ),

                  SizedBox(
                    height: context.sp(8),
                  ),

                  TextFormField(
                    controller: _descController,
                    maxLines: 5,
                    textInputAction:
                        TextInputAction.newline,
                    decoration: InputDecoration(
                      hintText: t.descriptionHint,
                    ),
                  ),

                  SizedBox(
                    height: context.sp(20),
                  ),

                  // =========================
                  // Status
                  // =========================

                  _FieldLabel(
                    text: t.status,
                  ),

                  SizedBox(
                    height: context.sp(8),
                  ),

                  DropdownButtonFormField<String>(
                    initialValue: currentStatus,
                    decoration:
                        const InputDecoration(),
                    items: statusOptions.map(
                      (status) {
                        return DropdownMenuItem<String>(
                          value: status,
                          child: Text(status),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }

                      final int index =
                          statusOptions.indexOf(value);

                      if (index != -1) {
                        setState(() {
                          _statusIndex = index;
                        });
                      }
                    },
                  ),

                  SizedBox(
                    height: context.sp(20),
                  ),

                  // =========================
                  // Choose Color
                  // =========================

                  _FieldLabel(
                    text: t.chooseColor,
                  ),

                  SizedBox(
                    height: context.sp(10),
                  ),

                  Wrap(
                    spacing: 14,
                    runSpacing: 10,
                    children:
                        _colorOptions.map((color) {
                      final bool selected =
                          color.value ==
                              _selectedColor.value;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedColor = color;
                          });
                        },
                        child: Container(
                          width: context.sp(34),
                          height: context.sp(34),
                          decoration:
                              BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: selected
                                ? Border.all(
                                    color: AppColors
                                        .textPrimary,
                                    width: 2.5,
                                  )
                                : null,
                          ),
                          child: selected
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.white,
                                  size: 18,
                                )
                              : null,
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(
                    height: context.sp(32),
                  ),

                  // =========================
                  // Save Button
                  // =========================

                  ElevatedButton(
                    onPressed: () {
                      _save(t);
                    },

                    // نفس شكل Continue
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          AppColors.primary,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(
                        double.infinity,
                        52,
                      ),
                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30),
                      ),
                      elevation: 0,
                    ),

                    child: Text(
                      t.saveTask,
                      style: TextStyle(
                        fontSize: context.sp(16),
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// Field Label
// =====================================================

class _FieldLabel extends StatelessWidget {
  const _FieldLabel({
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: context.sp(14),
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
      ),
    );
  }
}