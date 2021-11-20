import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_app/Homepage/homepage.dart';
import 'package:project_app/Screens/home/home_screen.dart';

import 'package:project_app/constants.dart';
import 'package:project_app/login/LoginPage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        primaryColor: kPrimaryColor,
        textTheme: GoogleFonts.kanitTextTheme(
          Theme.of(context).textTheme.apply(bodyColor: kTextColor),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
