import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/task_providers.dart';
import '../models/task.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:task_master/services/firestore_service.dart';
import 'package:logging/logging.dart';

class EditTaskScreen extends StatelessWidget {
  final int taskIndex;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  final Logger _logger = Logger('EditTaskScreen');

  EditTaskScreen({Key? key, required this.taskIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    final task = taskProvider.tasks[taskIndex];

    // Initialize the controllers with the existing task data
    titleController.text = task.title;
    detailController.text = task.description;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Edit Task',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: detailController,
              decoration: const InputDecoration(
                labelText: 'Detail',
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.teal),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    final user = FirebaseAuth.instance.currentUser;

                    if (user != null) {
                      final updatedTask = Task(
                        id: task.id,
                        title: titleController.text,
                        description: detailController.text,
                        isCompleted: task.isCompleted,
                        createdAt: task.createdAt,
                        updatedAt: DateTime.now(),
                        userId: user.uid,
                      );

                      // Update task in local provider
                      taskProvider.updateTask(
                        taskIndex.toString(),
                        titleController.text,
                        detailController.text,
                      );

                      // Update task in Firestore
                      FirestoreService().updateTask(updatedTask);

                      _logger.info(
                          'Task updated successfully for user: ${user.uid}');
                      Navigator.pop(context);
                    } else {
                      _logger.warning('User not logged in');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(150, 50),
                  ),
                  child: const Text(
                    'Update',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: const Size(150, 50),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
