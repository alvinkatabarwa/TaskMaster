import 'package:flutter/material.dart';

class Task {
  String title;
  String description;
  bool isCompleted;

  Task({required this.title, required this.description, this.isCompleted = false});
}

class TaskProvider with ChangeNotifier {
  List<Task> _tasks = [];

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

