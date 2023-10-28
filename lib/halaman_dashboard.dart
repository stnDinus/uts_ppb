import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uts/data.dart';

class HalamanDashboard extends StatefulWidget {
  final SharedPreferences spInstance;
  final String currentUsername;
  const HalamanDashboard(this.spInstance, this.currentUsername, {super.key});

  @override
  State<StatefulWidget> createState() => _HalamanDashboardState();
}

class _HalamanDashboardState extends State<HalamanDashboard> {
  Map<Item, int> keranjang = {};

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
                      padding: const EdgeInsets.only(top: 14, bottom: 14),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dashboard",
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                            Row(
                              children: [
                                Text(widget.currentUsername),
                                const Icon(Icons.person),
                              ],
                            )
                          ])),
                  GridView.count(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    mainAxisSpacing: 7,
                    crossAxisSpacing: 7,
                    crossAxisCount: 2,
                    children: listItem
                        .map((item) => Card(
                              clipBehavior: Clip.hardEdge,
                              child: InkWell(
                                  onTap: () {},
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                          child: Row(children: [
                                        Expanded(
                                          child: Image.asset(
                                            item.linkGambar,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      ])),
                                      Padding(
                                          padding: const EdgeInsets.all(7),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(item.nama,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                                const SizedBox(height: 7),
                                                Text(
                                                    NumberFormat("¤ ,###", "id")
                                                        .format(item.harga),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall),
                                                const SizedBox(height: 7),
                                                FilledButton.tonalIcon(
                                                  onPressed: () {
                                                    setState(() {
                                                      keranjang.update(item,
                                                          (value) => ++value,
                                                          ifAbsent: () => 1);
                                                    });
                                                  },
                                                  label: const Text("Tambah"),
                                                  icon: Stack(
                                                      clipBehavior: Clip.none,
                                                      children: [
                                                        const Icon(Icons
                                                            .add_shopping_cart),
                                                        keranjang[item] != null
                                                            ? Positioned(
                                                                top: -7,
                                                                right: -7,
                                                                child: Badge(
                                                                    label: Text(
                                                                        keranjang[item]
                                                                            .toString())))
                                                            : const SizedBox
                                                                .shrink()
                                                      ]),
                                                )
                                              ]))
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
