import 'package:flutter/material.dart';
import 'package:flutter_portfolio/fetures/home/ui/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        fontFamily: GoogleFonts.merriweatherSans().fontFamily,
        textTheme: TextTheme(
          titleLarge: TextStyle(fontWeight: FontWeight.w600,fontSize: 24,color: Colors.white),
          titleMedium: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),
          titleSmall: TextStyle(fontSize: 16,fontWeight: FontWeight.w400,color: Colors.white),

        ),
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
