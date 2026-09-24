import 'package:flutter/material.dart';

class AppLocalizations {
  final BuildContext context;

  AppLocalizations(this.context);

  static AppLocalizations of(BuildContext context) {
    return AppLocalizations(context);
  }

  // =========================
  // Create Profile
  // =========================

  String get createYourProfile => 'Create Your Profile';

  String get addNamePhoto => 'Add your name and photo';

  String get fullName => 'Full Name';

  String get fullNameHint => 'Enter your full name';

  String get nameRequired => 'Please enter your name';

  String get continueBtn => 'Continue';

  // =========================
  // Home
  // =========================

  String get goodMorning => 'Good Morning';

  String get tasks => 'Tasks';

  String get done => 'Done';

  String get pending => 'Pending';

  String get todaysTasks => "Today's Tasks";

  String get task => 'Task';

  // =========================
  // Home Tasks
  // =========================

  String get flutterUi => 'Flutter UI';

  String get buildRegisterScreen => 'Build Register Screen';

  String get workout => 'Workout';

  String get gymAt6pm => 'Gym at 6 PM';

  String get meeting => 'Meeting';

  String get teamSync => 'Team Sync';

  String get readBook => 'Read Book';

  String get atomicHabits => 'Atomic Habits';

  // =========================
  // Add Task
  // =========================

  String get addTask => 'Add Task';

  String get taskTitle => 'Task Title';

  String get taskTitleHint => 'Enter task title';

  String get description => 'Description';

  String get descriptionHint => 'Enter task description';

  String get status => 'Status';

  String get statusPending => 'Pending';

  String get statusInProgress => 'In Progress';

  String get statusDone => 'Done';

  String get chooseColor => 'Choose Color';

  String get saveTask => 'Save Task';

  String get taskSaved => 'Task saved successfully';
}