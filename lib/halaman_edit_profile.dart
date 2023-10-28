import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts/halaman_user.dart';

class HalamanEditProfile extends StatefulWidget {
  final SharedPreferences spInstance;
  final String currentUsername;
  const HalamanEditProfile(this.spInstance, this.currentUsername, {super.key});

  @override
  State<StatefulWidget> createState() => _HalamanEditProfileState();
}

class _HalamanEditProfileState extends State<HalamanEditProfile> {
  TextEditingController usernameBaruController = TextEditingController(),
      passwordLamaController = TextEditingController(),
      passwordBaruController = TextEditingController(),
      konfirmasiPasswordBaruController = TextEditingController();
  bool showPasswordLama = false,
      showPasswordBaru = false,
      showKonfirmasiPasswordBaru = false;
  Map<String, dynamic> imitasiTabelUser = {};
  String? usernameBaruError,
      passwordLamaError = "Password lama salah",
      passwordBaruError = "Password tidak boleh kosong",
      konfirmasiPasswordBaruError;

  @override
  void initState() {
    super.initState();

    String? imitasiTabelUserSp = widget.spInstance.getString("user");

    imitasiTabelUser =
        imitasiTabelUserSp == null ? {} : json.decode(imitasiTabelUserSp);

    usernameBaruController.text = widget.currentUsername;
  }

  void validasiUsernameBaru() {
    if (usernameBaruController.text.isEmpty) {
      setState(() {
        usernameBaruError = "Username tidak boleh kosong";
      });
      return;
    }

    if (imitasiTabelUser.keys.contains(usernameBaruController.text) &&
        usernameBaruController.text != widget.currentUsername) {
      setState(() {
        usernameBaruError = "Username telah terpakai";
      });
      return;
    }

    setState(() {
      usernameBaruError = null;
    });
  }

  void validasiPasswordLama() {
    final String password = passwordLamaController.text;

    if (password != imitasiTabelUser[widget.currentUsername].toString()) {
      setState(() {
        passwordLamaError = "Password lama salah";
      });
      return;
    }

    setState(() {
      passwordLamaError = null;
    });
  }

  void validasiPasswordBaru() {
    final String password = passwordBaruController.text;

    if (password.isEmpty) {
      setState(() {
        passwordBaruError = "Password tidak boleh kosong";
      });
      return;
    }

    if (!RegExp(r"[A-Z]").hasMatch(password)) {
      setState(() {
        passwordBaruError = "Password harus mengandung huruf besar";
      });
      return;
    }

    if (!RegExp(r"[a-z]").hasMatch(password)) {
      setState(() {
        passwordBaruError = "Password harus mengandung huruf kecil";
      });
      return;
    }

    if (!RegExp(r"[0-9]").hasMatch(password)) {
      setState(() {
        passwordBaruError = "Password harus mengandung angka";
      });
      return;
    }

    setState(() {
      passwordBaruError = null;
    });
  }

  void validasiKonfirmasiPasswordBaru() {
    if (konfirmasiPasswordBaruController.text != passwordBaruController.text) {
      setState(() {
        konfirmasiPasswordBaruError = "Password tidak sama";
      });
      return;
    }

    setState(() {
      konfirmasiPasswordBaruError = null;
    });
  }

  void toggleShowPasswordLama() {
    setState(() {
      showPasswordLama = !showPasswordLama;
    });
  }

  void toggleShowPasswordBaru() {
    setState(() {
      showPasswordBaru = !showPasswordBaru;
    });
  }

  void toggleShowKonfirmasiPasswordBaru() {
    setState(() {
      showKonfirmasiPasswordBaru = !showKonfirmasiPasswordBaru;
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
                      controller: usernameBaruController,
                      onChanged: (_) => validasiUsernameBaru(),
                      decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          label: const Text("Username"),
                          errorText: usernameBaruError,
                          border: const OutlineInputBorder()),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: passwordLamaController,
                      onChanged: (_) => validasiPasswordLama(),
                      obscureText: !showPasswordLama,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.key),
                          label: const Text("Password lama"),
                          errorText: passwordLamaError,
                          suffixIcon: GestureDetector(
                            onTap: toggleShowPasswordLama,
                            child: Icon(showPasswordLama
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          border: const OutlineInputBorder()),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: passwordBaruController,
                      onChanged: (_) {
                        validasiPasswordBaru();
                        validasiKonfirmasiPasswordBaru();
                      },
                      obscureText: !showPasswordBaru,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.key),
                          label: const Text("Password baru"),
                          errorText: passwordBaruError,
                          suffixIcon: GestureDetector(
                            onTap: toggleShowPasswordBaru,
                            child: Icon(showPasswordBaru
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          border: const OutlineInputBorder()),
                    ),
                    const SizedBox(height: 14),
                    TextField(
                      controller: konfirmasiPasswordBaruController,
                      onChanged: (_) => validasiKonfirmasiPasswordBaru(),
                      obscureText: !showKonfirmasiPasswordBaru,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.check_circle),
                          label: const Text("Konfirmasi password"),
                          errorText: konfirmasiPasswordBaruError,
                          suffixIcon: GestureDetector(
                            onTap: toggleShowKonfirmasiPasswordBaru,
                            child: Icon(showKonfirmasiPasswordBaru
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          border: const OutlineInputBorder()),
                    ),
                    const SizedBox(height: 14),
                    Row(children: [
                      Expanded(
                        child: FilledButton.icon(
                            onPressed: (usernameBaruError == null &&
                                    passwordLamaError == null &&
                                    passwordBaruError == null &&
                                    konfirmasiPasswordBaruError == null)
                                ? () async {
                                    imitasiTabelUser
                                        .remove(widget.currentUsername);

                                    imitasiTabelUser.addEntries({
                                      usernameBaruController.text:
                                          passwordBaruController.text
                                    }.entries);

                                    await widget.spInstance.setString(
                                        "user", json.encode(imitasiTabelUser));

                                    if (!context.mounted) return;

                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HalamanUser(
                                                  widget.spInstance,
                                                  passMessage:
                                                      "Data berhasil disimpan, silahkan login kembali",
                                                )),
                                        (route) => false);
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
