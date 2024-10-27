import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/settings_provider.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final settingsProvider = Provider.of<SettingsProvider>(context);

    // Set initial values for controllers
    _usernameController.text = settingsProvider.username;
    _passwordController.text = settingsProvider.password;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Change Username",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'Enter new username',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Change Password",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter new password',
                border: UnderlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Language",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            DropdownButton<String>(
              value: settingsProvider.language,
              items: ['English', 'Spanish', 'French']
                  .map((language) => DropdownMenuItem(
                        value: language,
                        child: Text(language),
                      ))
                  .toList(),
              onChanged: (newLanguage) {
                settingsProvider.updateLanguage(newLanguage!);
              },
            ),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  settingsProvider.updateUsername(_usernameController.text);
                  settingsProvider.updatePassword(_passwordController.text);

                  // Optionally, show a confirmation
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Settings updated')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: Text(
                  'Save Changes',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
