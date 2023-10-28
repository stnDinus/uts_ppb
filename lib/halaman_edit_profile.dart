import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HalamanEditProfile extends StatefulWidget {
  final SharedPreferences spInstance;
  const HalamanEditProfile(this.spInstance, {super.key});

  @override
  State<StatefulWidget> createState() => _HalamanEditProfileState();
}

class _HalamanEditProfileState extends State<HalamanEditProfile> {
  TextEditingController usernameController = TextEditingController(),
      passwordController = TextEditingController(),
      konfirmasiPasswordController = TextEditingController();
  bool showPassword = false, showKonfirmasiPassword = false;
  Map<String, dynamic> imitasiTabelUser = {};
  String? usernameError, passwordError, konfirmasiPasswordError;

  @override
  void initState() {
    super.initState();

    String? imitasiTabelUserSp = widget.spInstance.getString("user");

    imitasiTabelUser =
        imitasiTabelUserSp == null ? {} : json.decode(imitasiTabelUserSp);
  }

  void validasiUsername(String value) {
    if (value.isEmpty) {
      setState(() {
        usernameError = "Username tidak boleh kosong";
      });
      return;
    }

    if (imitasiTabelUser.keys.contains(value)) {
      setState(() {
        usernameError = "Username telah terpakai";
      });
      return;
    }

    setState(() {
      usernameError = null;
    });
  }

  void validasiPassword(String value) {
    if (value.isEmpty) {
      setState(() {
        passwordError = "Password tidak boleh kosong";
      });
      return;
    }

    if (!RegExp(r"[A-Z]").hasMatch(value)) {
      setState(() {
        passwordError = "Password harus mengandung huruf besar";
      });
      return;
    }

    if (!RegExp(r"[a-z]").hasMatch(value)) {
      setState(() {
        passwordError = "Password harus mengandung huruf kecil";
      });
      return;
    }

    if (!RegExp(r"[0-9]").hasMatch(value)) {
      setState(() {
        passwordError = "Password harus mengandung angka";
      });
      return;
    }

    setState(() {
      passwordError = null;
    });
  }

  void validasiKonfirmasiPassword(String value) {
    if (value != passwordController.text) {
      setState(() {
        konfirmasiPasswordError = "Password tidak sama";
      });
      return;
    }

    setState(() {
      konfirmasiPasswordError = null;
    });
  }

  void toggleShowPassword() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  void toggleShowKonfirmasiPassword() {
    setState(() {
      showKonfirmasiPassword = !showKonfirmasiPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(7),
      child: Center(
          child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      const BackButton(),
                      Text("Kembali",
                          style: Theme.of(context).textTheme.bodyLarge)
                    ]),
                    const SizedBox(height: 14),
                    TextField(
                      controller: usernameController,
                      onChanged: (value) => validasiUsername(value),
                      decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          label: const Text("Username"),
                          errorText: usernameError,
                          border: const OutlineInputBorder()),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: passwordController,
                      onChanged: (value) => validasiPassword(value),
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.key),
                          label: const Text("Password"),
                          errorText: passwordError,
                          suffixIcon: GestureDetector(
                            onTap: toggleShowPassword,
                            child: Icon(showPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          border: const OutlineInputBorder()),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: konfirmasiPasswordController,
                      onChanged: (value) => validasiKonfirmasiPassword(value),
                      obscureText: !showKonfirmasiPassword,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.check_circle),
                          label: const Text("Konfirmasi password"),
                          errorText: konfirmasiPasswordError,
                          suffixIcon: GestureDetector(
                            onTap: toggleShowKonfirmasiPassword,
                            child: Icon(showKonfirmasiPassword
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          border: const OutlineInputBorder()),
                    ),
                    const SizedBox(height: 14),
                    Row(children: [
                      Expanded(
                        child: FilledButton.icon(
                            onPressed: (usernameError == null &&
                                    passwordError == null &&
                                    konfirmasiPasswordError == null)
                                ? () async {
                                    imitasiTabelUser.addEntries({
                                      usernameController.text:
                                          passwordController.text
                                    }.entries);

                                    await widget.spInstance.setString(
                                        "user", json.encode(imitasiTabelUser));

                                    if (!context.mounted) return;

                                    Navigator.pop(context);
                                  }
                                : null,
                            icon: const Icon(Icons.save),
                            label: const Text("Simpan")),
                      )
                    ]),
                  ]))),
    ));
  }
}
