



import 'package:flutter/material.dart';
import 'package:pa/utils/appTheme.dart';
import 'package:pa/view/homeScreen.dart';

import 'Router/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Set to false for production
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const HomeScreen(),
      theme: AppTheme.lightTheme, // Use the custom theme
    );
  }
}
