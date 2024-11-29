import 'package:flutter/foundation.dart';
import '../models/task.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskProvider with ChangeNotifier {
  final List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  Future<void> fetchTasks() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('tasks').get();
      _tasks = snapshot.docs.map((doc) => Task.fromFirestore(doc)).toList();
      notifyListeners();
    } catch (e) {
      // Handle errors appropriately
    }
  }

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    _tasks.remove(task);
    notifyListeners();
  }

  void toggleTaskCompletion(Task task) {
    final taskIndex = _tasks.indexOf(task);
    if (taskIndex != -1) {
      _tasks[taskIndex] = Task(
        id: task.id,
        title: task.title,
        description: task.description,
        isCompleted: !task.isCompleted,
        createdAt: task.createdAt,
        updatedAt: DateTime.now(),
        userId: task.userId,
      );
      notifyListeners();
    }
  }

  void updateTask(String id, String newTitle, String newDescription) {
    final taskIndex = _tasks.indexWhere((task) => task.id == id);
    if (taskIndex != -1) {
      _tasks[taskIndex] = Task(
        id: id,
        title: newTitle,
        description: newDescription,
        isCompleted: _tasks[taskIndex].isCompleted,
        createdAt: _tasks[taskIndex].createdAt,
        updatedAt: DateTime.now(),
        userId: _tasks[taskIndex].userId,
      );
      notifyListeners();
    }
  }
}
