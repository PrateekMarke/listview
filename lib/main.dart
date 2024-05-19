import 'package:flutter/material.dart';
import 'login.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'backup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}