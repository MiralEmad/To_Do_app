import 'package:flutter/material.dart';
import 'package:todo_app/features/home/home_screen.dart';
import 'package:todo_app/features/login/login_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(userName: 'Mora',)
    );
  }
}