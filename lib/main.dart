import 'package:flutter/material.dart';
import 'package:web_app/views/home/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Photos',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: HomeView(),
    );
  }
}
