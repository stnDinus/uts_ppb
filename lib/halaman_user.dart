import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts/halaman_login.dart';
import 'package:uts/halaman_registrasi.dart';

class HalamanUser extends StatefulWidget {
  final SharedPreferences spInstance;
  final String? passMessage;

  const HalamanUser(this.spInstance, {super.key, this.passMessage});

  @override
  State<StatefulWidget> createState() => _HalamanUserState();
}

class _HalamanUserState extends State<HalamanUser> {
  @override
  void initState() {
    if (widget.passMessage != null) {
      Timer(Duration.zero, () {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(widget.passMessage!),
          action: SnackBarAction(
            label: "Tutup",
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
            },
          ),
        ));
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Hero(
                            tag: "title",
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.eco_sharp,
                                      size: 50, color: Color(0xFF8EC07C)),
                                  Text("Pejuang Tani",
                                      style: GoogleFonts.unna(
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .displaySmall))
                                ])),
                        const SizedBox(height: 28),
                        FilledButton.icon(
                          label: const Text("Login"),
                          icon: const Icon(Icons.login),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HalamanLogin(widget.spInstance)));
                          },
                        ),
                        const SizedBox(height: 14),
                        OutlinedButton.icon(
                          label: const Text("Registrasi"),
                          icon: const Icon(Icons.person),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        HalamanRegistrasi(widget.spInstance)));
                          },
                        ),
                      ],
                    )))));
  }
}
