import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trumpApp/globals.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sh*t Trump Says',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(child: MainScreen()),
    );
  }
}

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String currentQuote = 'Please wait while we search for some nonsense...';

  Color backgroundColor;
  Color textColor;

  Color fabBackgroundColor;
  Color fabIconColor;

  @override
  void initState() {
    super.initState();
  }

  selectRandomColorSchemeArray() {
    
  }

  selectRandomQuote() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
