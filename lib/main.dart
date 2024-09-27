import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thuctap/configs/theme_provider.dart';
import 'package:thuctap/screens/welcome_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Dark/Light Mode',
          theme: themeProvider.themeData,
          home: const WelcomeScreen(),
        );
      },
    );
  }
}
