import 'package:flutter/material.dart';

class Task {
  String id;
  String title;
  String description;
  bool isCompleted;
  DateTime createdAt; // Add createdAt
  DateTime updatedAt; // Add updatedAt
  String userId; // Add userId

  Task({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.createdAt, // Add to constructor
    required this.updatedAt, // Add to constructor
    required this.userId, // Add to constructor
  });
}

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void toggleTaskCompletion(Task task) {
    task.isCompleted = !task.isCompleted;
    notifyListeners();
  }

  // Method to update a task's title and description
  void updateTask(int index, String newTitle, String newDescription) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].title = newTitle;
      _tasks[index].description = newDescription;
      notifyListeners();
    }
  }
}
