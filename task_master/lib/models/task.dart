import 'package:cloud_firestore/cloud_firestore.dart';

class Tasks {
  String title;
  String description;
  bool isCompleted;
  DateTime createdAt;
  DateTime updatedAt;
  String userId; // To store the user ID
  int id; // Task ID

  Tasks({
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.id,
  });

  // Convert a Task object to a map for Firestore
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'completed': isCompleted,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user_id': userId,
      'id': id,
    };
  }

  // Create a Task object from a Firestore document
  factory Tasks.fromMap(Map<String, dynamic> map) {
    return Tasks(
      title: map['title'],
      description: map['description'],
      isCompleted: map['completed'],
      createdAt: (map['created_at'] as Timestamp).toDate(),
      updatedAt: (map['updated_at'] as Timestamp).toDate(),
      userId: map['user_id'],
      id: map['id'],
    );
  }

  // Add the fromTask method
  static Tasks fromTask(Tasks task) {
    return Tasks(
      title: task.title,
      description: task.description,
      isCompleted: task.isCompleted,
      createdAt: task.createdAt,
      updatedAt: task.updatedAt,
      userId: task.userId,
      id: task.id,
    );
  }
}
