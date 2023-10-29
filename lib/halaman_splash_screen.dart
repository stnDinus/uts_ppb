import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts/halaman_user.dart';

class HalamanSplashScreen extends StatefulWidget {
  const HalamanSplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HalamanSplashScreenState();
}

class _HalamanSplashScreenState extends State<HalamanSplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 2), () async {
      SharedPreferences spInstance = await SharedPreferences.getInstance();

      if (!context.mounted) return;

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HalamanUser(spInstance),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Hero(
      tag: "title",
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Icon(Icons.eco_sharp, size: 50, color: Color(0xFF8EC07C)),
        Text("Pejuang Tani",
            style: GoogleFonts.unna(
                textStyle: Theme.of(context).textTheme.displaySmall))
      ]),
    )));
  }
}
