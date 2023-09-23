import 'package:flutter/material.dart';
import 'view/home_screen.dart';
import 'view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showSplash = true;
  showSplashScreen() {
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        showSplash = false;
      });
    });
  }

  @override
  void initState() {
    showSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dmeme',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: showSplash ? const SplashScreen() : const HomeScreen(),
    );
  }
}
