import 'package:flutter/material.dart';
import 'package:zum_clone/screens/login_screen.dart';
import 'package:zum_clone/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zum',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
      },
      home: const LoginScreen(),
    );
  }
}
