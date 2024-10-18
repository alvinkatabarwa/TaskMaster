import 'package:flutter/material.dart';
import 'todo.dart';

class EditTaskScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  EditTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Back to the previous screen
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
            // Title TextField
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
            // Detail TextField
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
                // Update Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TaskListScreen()),
                    );
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
                // Cancel Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Cancel and go back
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