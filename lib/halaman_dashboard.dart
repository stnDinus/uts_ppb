import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts/data.dart';
import 'package:uts/halaman_item.dart';

class HalamanDashboard extends StatelessWidget {
  final SharedPreferences spInstance;
  final String currentUsername;
  const HalamanDashboard(this.spInstance, this.currentUsername, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(7),
      child: Center(
          child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              child: ListView(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dashboard",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            Row(
                              children: [
                                Text(currentUsername),
                                const Icon(Icons.person),
                              ],
                            )
                          ])),
                  GridView.count(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    mainAxisSpacing: 7,
                    crossAxisSpacing: 7,
                    crossAxisCount: 3,
                    children: listItem
                        .map((item) => InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (route) => HalamanItem(item)));
                              },
                              child: Padding(
                                  padding: const EdgeInsets.all(7),
                                  child: Column(
                                    children: [
                                      Expanded(
                                          flex: 1,
                                          child: Row(children: [
                                            Expanded(
                                              child: Image.asset(
                                                item.linkGambar,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          ])),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(item.nama),
                                              Text(
                                                item.deskripsi,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelSmall,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(item.harga.toString()),
                                            ]),
                                      )
                                    ],
                                  )),
                            ))
                        .toList(),
                  ),
                ],
              ))),
    ));
  }
}
