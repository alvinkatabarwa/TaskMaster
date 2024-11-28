import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/task.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Add Firebase Auth for user ID
import 'package:logging/logging.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance
  final Logger _logger = Logger('FirestoreService');

  // Add a task to Firestore
  Future<void> addTask(Tasks task) async {
    try {
      final user = _auth.currentUser; // Get the current user
      if (user == null) {
        throw Exception("User is not logged in");
      }

      final tasksRef = _db.collection('tasks');

      // Assign the userId and taskId before adding the task
      final taskId = DateTime.now()
          .millisecondsSinceEpoch; // Use current timestamp as task ID

      await tasksRef.add({
        'title': task.title,
        'description': task.description,
        'completed': task.isCompleted,
        'created_at': task.createdAt,
        'updated_at': task.updatedAt,
        'user_id': user.uid, // Store the current user's UID
        'id': taskId, // Add task ID
      });

      _logger.info("Task added with ID: $taskId");
    } catch (e) {
      _logger.severe("Error adding task: $e");
    }
  }

  // Method to update task completion status
  Future<void> updateTaskCompletion(String taskId, bool isCompleted) async {
    try {
      final tasksRef = _db.collection('tasks');
      await tasksRef.doc(taskId).update({
        'completed': isCompleted,
        'updated_at': DateTime.now(),
      });
    } catch (e) {
      _logger.severe("Error updating task: $e");
    }
  }
}
