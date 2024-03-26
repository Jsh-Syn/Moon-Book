import 'package:flutter/material.dart';
import 'package:flutter_course/pages/home_page.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Moon Book",
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromARGB(255, 32, 31, 31)),
      home: Homepage(),
    );
  }
}
