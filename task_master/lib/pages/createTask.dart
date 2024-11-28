import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_providers.dart' as provider_task;
import '../models/task.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth to get current user
import 'package:task_master/services/firestore_service.dart';
import 'package:logging/logging.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  final Logger _logger = Logger('CreateTaskPage');

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Add Task',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: detailController,
              decoration: const InputDecoration(
                labelText: 'Detail',
                border: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  final taskProvider = Provider.of<provider_task.TaskProvider>(
                      context,
                      listen: false);
                  final user =
                      FirebaseAuth.instance.currentUser; // Get current user

                  if (user != null) {
                    final newTask = provider_task.Task(
                      title: titleController.text,
                      description: detailController.text,
                      isCompleted: false,
                      createdAt: DateTime.now(),
                      updatedAt: DateTime.now(),
                      userId: user.uid, // Pass user ID
                      id: DateTime.now()
                          .millisecondsSinceEpoch
                          .toString(), // Generate task ID
                    );
                    taskProvider.addTask(newTask);

                    // Convert Task to Tasks if necessary
                    Tasks tasks = Tasks.fromTask(newTask
                        as Tasks); // Cast NewTask to Tasks if appropriate

                    // Add task to Firestore
                    FirestoreService().addTask(tasks);

                    Navigator.pop(context);
                  } else {
                    _logger.warning("User not logged in");
                  }
                },
                child: const Text(
                  'ADD',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
