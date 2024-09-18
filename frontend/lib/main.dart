import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(KermisysApp());
}

class KermisysApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kermisys',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
