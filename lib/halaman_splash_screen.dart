import 'dart:async';

import 'package:flutter/material.dart';
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

    Timer(const Duration(seconds: 1), () async {
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
            child: Text("Selamat Datang!",
                style: Theme.of(context).textTheme.titleLarge)));
  }
}
