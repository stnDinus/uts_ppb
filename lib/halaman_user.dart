import 'dart:async';

import 'package:flutter/material.dart';
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
                constraints: const BoxConstraints(maxWidth: 500),
                child: Padding(
                    padding: const EdgeInsets.all(7),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton.icon(
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
                        Padding(
                            padding: const EdgeInsets.all(14),
                            child: Text(
                              "atau",
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.labelSmall,
                            )),
                        ElevatedButton.icon(
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
