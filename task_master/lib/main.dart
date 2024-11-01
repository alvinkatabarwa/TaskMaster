import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/Welcome.dart';
import 'providers/task_providers.dart';
import 'providers/settings_providers.dart';
import 'providers/registration_providers.dart';
import 'providers/login_providers.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TaskProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => RegistrationProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Task Master',
        home: WelcomeScreen(),
      ),
    );
  }
}

