import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uts/data.dart';
import 'package:uts/halaman_edit_profile.dart';
import 'package:uts/halaman_item.dart';
import 'package:uts/halaman_pembayaran.dart';

class HalamanDashboard extends StatefulWidget {
  final SharedPreferences spInstance;
  final String currentUsername;
  const HalamanDashboard(this.spInstance, this.currentUsername, {super.key});

  @override
  State<StatefulWidget> createState() => _HalamanDashboardState();
}

class _HalamanDashboardState extends State<HalamanDashboard> {
  Map<Item, int> keranjang = {};
  NumberFormat nFormatter = NumberFormat("¤ ,###", "id");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(7),
      child: Stack(
        children: [
          Center(
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
                                  "Estalase",
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        icon: const Icon(Icons.call),
                                        onPressed: () {
                                          launchUrl(Uri(
                                              scheme: "tel",
                                              host: "111202214433"));
                                        }),
                                    IconButton(
                                        icon: const Icon(Icons.mail),
                                        onPressed: () {
                                          launchUrl(Uri(
                                              scheme: "mailto",
                                              path:
                                                  "111202214433@mhs.dinus.ac.id",
                                              query: "subject=Pejuang Tani"));
                                        }),
                                    IconButton(
                                        icon: const Icon(Icons.location_on),
                                        onPressed: () {
                                          launchUrl(Uri(
                                              scheme: "geo",
                                              path:
                                                  "-7.229492701483863,109.81573124197979",
                                              query: "q=Desa Ratamba"));
                                        }),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      HalamanEditProfile(
                                                          widget.spInstance,
                                                          widget
                                                              .currentUsername)));
                                        },
                                        icon: const Icon(Icons.person))
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
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HalamanItem(item)));
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              child: Row(children: [
                                            Expanded(
                                              child: Hero(
                                                  tag: item.linkGambar,
                                                  child: Image.asset(
                                                    item.linkGambar,
                                                    fit: BoxFit.cover,
                                                  )),
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
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                    Text(item.deskripsi,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelSmall),
                                                    const SizedBox(height: 7),
                                                    Text(nFormatter
                                                        .format(item.harga)),
                                                    const SizedBox(height: 7),
                                                    FilledButton.tonalIcon(
                                                      onPressed: () {
                                                        setState(() {
                                                          keranjang.update(
                                                              item,
                                                              (value) =>
                                                                  ++value,
                                                              ifAbsent: () =>
                                                                  1);
                                                        });
                                                      },
                                                      label:
                                                          const Text("Tambah"),
                                                      icon: Stack(
                                                          clipBehavior:
                                                              Clip.none,
                                                          children: [
                                                            const Icon(Icons
                                                                .add_shopping_cart),
                                                            keranjang[item] !=
                                                                    null
                                                                ? Positioned(
                                                                    top: -7,
                                                                    right: -7,
                                                                    child: Badge(
                                                                        label: Text(keranjang[item]
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
                      )
                    ],
                  ))),
          keranjang.isEmpty
              ? const SizedBox.shrink()
              : Positioned(
                  bottom: 0,
                  right: 0,
                  child: FloatingActionButton.extended(
                      onPressed: () async {
                        Map<Item, int> keranjangBaru = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    HalamanPembayaran(keranjang)));

                        setState(() {
                          keranjang = keranjangBaru;
                        });
                      },
                      icon: const Icon(Icons.shopping_cart_checkout),
                      label: Text(
                          "Total:\n${nFormatter.format(keranjang.entries.map((entry) => entry.key.harga * entry.value).reduce((a, b) => a + b))}")))
        ],
      ),
    ));
  }
}
