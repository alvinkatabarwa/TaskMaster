import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/Welcome.dart';
import 'providers/task_provider.dart';
import 'providers/settings_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Master',
        home: WelcomeScreen(),
      ),
    );
  }
}

