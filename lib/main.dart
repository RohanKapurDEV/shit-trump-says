import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trumpApp/globals.dart';
import 'dart:math';
import 'package:url_launcher/url_launcher.dart';

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
    refreshQuoteAndColors();
  }

  selectRandomColorSchemeList() {
    Random rnd = new Random();

    final List subList = colorSchemeList[rnd.nextInt(colorSchemeList.length)];
    setState(() {
      this.backgroundColor = Color(subList[0]);
      this.textColor = Color(subList[1]);

      this.fabIconColor = Color(subList[0]);
      this.fabBackgroundColor = Color(subList[1]);
    });
  }

  selectRandomQuote() {
    Random rnd = new Random();

    final String freshQuote = quotesList[rnd.nextInt(quotesList.length)];
    setState(() {
      this.currentQuote = freshQuote;
    });
  }

  refreshQuoteAndColors() {
    setState(() {
      selectRandomColorSchemeList();
      selectRandomQuote();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: textColor),
        backgroundColor: backgroundColor,
        title: Text('Sh*t Donald Trump Says',
            style: GoogleFonts.ubuntu(color: textColor)),
        centerTitle: true,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          refreshQuoteAndColors();
        },
        backgroundColor: fabBackgroundColor,
        child: Icon(Icons.refresh, color: fabIconColor),
      ),
      drawer: Drawer(
        child: Container(
          color: backgroundColor,
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text(
                  'Information',
                  style: GoogleFonts.ubuntu(color: textColor),
                  textScaleFactor: 1.2,
                ),
                leading: Icon(Icons.info_outline, color: textColor),
                onTap: () {
                  Navigator.of(context, rootNavigator: true).push(
                      new CupertinoPageRoute(
                          builder: (_) => InformationView()));
                },
              ),
              AboutListTile(
                child: Text(
                  'Licenses',
                  style: GoogleFonts.ubuntu(color: textColor),
                  textScaleFactor: 1.2,
                ),
                applicationVersion: '1.0.0',
                icon: Icon(Icons.pages, color: textColor),
              ),
              SizedBox(height: 16),
              ListTile(
                title: Text(
                  'Made by: Rohan Kapur\n\nTwitter: @RohanXKapur',
                  style: GoogleFonts.ubuntu(color: textColor),
                  textScaleFactor: 1.2,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: backgroundColor,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Text(
              currentQuote,
              style: GoogleFonts.merriweather(color: textColor, fontSize: 30),
            ),
          ),
        ),
      ),
    );
  }
}

class InformationView extends StatelessWidget {
  const InformationView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Information',
          style: GoogleFonts.ubuntu(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Text(
              "I've tried to ensure the accuracy of the quotes to the best of my abilities but cannot and will not provide any guaruntees that everything is 100% accurate.",
              textScaleFactor: 1.2,
            ),
            SizedBox(height: 16),
            Text(
              "If you believe any of the information is incorrect, feel free to contact me via Twitter and I'll be more than happy to make the necessary changes.",
              textScaleFactor: 1.2,
            ),
            SizedBox(height: 16),
            Text(
              "Hopefully this goes without saying but just to be clear, this app was made for jokes and a laugh.",
              textScaleFactor: 1.2,
            ),
            SizedBox(height: 16),
            ListTile(
              title: Text(
                'Contact me on Twitter',
                style: GoogleFonts.ubuntu(color: Colors.blue),
              ),
              onTap: () {
                _launchTwitter();
              },
            ),
          ],
        ),
      ),
    );
  }
}

_launchTwitter() async {
  const url = 'https://twitter.com/RohanXKapur';
  if (await canLaunch(url)) {
    await launch(url);
  }
}