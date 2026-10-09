
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

const purple = Color(0xFF7B61FF);
const background = Color(0xFF111118);
const cardColor = Color(0xFF20202C);

void main() {
  runApp(const FlexApp());
}

class FlexApp extends StatelessWidget {
  const FlexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FlexApp',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: background,
        colorScheme: const ColorScheme.dark(
          primary: purple,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}