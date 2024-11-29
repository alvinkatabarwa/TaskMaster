import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_providers.dart'; // Renamed file to reflect class name
import '../models/task.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_master/services/firestore_service.dart';
import 'package:logging/logging.dart';

class AddTaskScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  final Logger _logger = Logger('AddTaskScreen');

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
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
                  final taskProvider =
                      Provider.of<TaskProvider>(context, listen: false);
                  final user = FirebaseAuth.instance.currentUser;

                  if (user != null) {
                    final newTask = Task(
                      id: DateTime.now().millisecondsSinceEpoch.toString(),
                      title: titleController.text,
                      description: detailController.text,
                      isCompleted: false,
                      createdAt: DateTime.now(),
                      updatedAt: DateTime.now(),
                      userId: user.uid,
                    );

                    // Add task to local provider
                    taskProvider.addTask(newTask);

                    // Save task to Firestore
                    FirestoreService().addTask(newTask);

                    _logger
                        .info('Task added successfully for user: ${user.uid}');
                    Navigator.pop(context);
                  } else {
                    _logger.warning('User not logged in');
                  }
                },
                child: const Text(
                  'ADD',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
