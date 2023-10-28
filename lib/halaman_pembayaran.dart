import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uts/data.dart';

class HalamanPembayaran extends StatefulWidget {
  final Map<Item, int> keranjang;
  const HalamanPembayaran(this.keranjang, {super.key});

  @override
  State<StatefulWidget> createState() => _HalamanPembayaranState();
}

class _HalamanPembayaranState extends State<HalamanPembayaran> {
  Map<Item, int>? keranjang = {};

  @override
  void initState() {
    super.initState();
    keranjang = widget.keranjang;
  }

  @override
  Widget build(BuildContext context) {
    NumberFormat nFormatter = NumberFormat("¤ ,###", "id");

    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(7),
            child: Center(
                child: Container(
              constraints: const BoxConstraints(maxWidth: 500),
              child: ListView(children: [
                const SizedBox(height: 14),
                Row(
                  children: [
                    BackButton(
                      onPressed: () {
                        Navigator.pop(context, keranjang);
                      },
                    ),
                    Text("Keranjang",
                        style: Theme.of(context).textTheme.displaySmall)
                  ],
                ),
                const SizedBox(height: 14),
                ...(keranjang!.keys.map((item) => Card(
                    child: Padding(
                        padding: const EdgeInsets.all(7),
                        child: Row(children: [
                          SizedBox.square(
                            dimension: 75,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: Image.asset(
                                item.linkGambar,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 7),
                          Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                Text(item.nama),
                                Text(
                                    "${nFormatter.format(item.harga)} x${keranjang![item]}"),
                                Text(
                                    "Total: ${nFormatter.format(item.harga * keranjang![item]!)}")
                              ])),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  keranjang!.remove(item);
                                });
                              },
                              icon: Icon(Icons.delete,
                                  color: Theme.of(context).colorScheme.error))
                        ])))))
              ]),
            ))));
  }
}
