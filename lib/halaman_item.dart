import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uts/data.dart';

class HalamanItem extends StatelessWidget {
  final Item item;

  const HalamanItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: Center(
              child: Container(
        constraints: const BoxConstraints(maxWidth: 500),
        child: Padding(
            padding: const EdgeInsets.all(7),
            child: ListView(
              children: [
                Row(children: [
                  const BackButton(),
                  Text("Kembali", style: Theme.of(context).textTheme.titleLarge)
                ]),
                AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(item.linkGambar, fit: BoxFit.cover)),
                const SizedBox(height: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.nama,
                      style: Theme.of(context).textTheme.displaySmall,
                    ),
                    const SizedBox(height: 14),
                    Text("Harga",
                        style: Theme.of(context).textTheme.labelSmall),
                    Text(
                      NumberFormat("¤ ,###.00", "id").format(item.harga),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 14),
                    Text(item.deskripsiDetail),
                  ],
                ),
              ],
            )),
      )));
}
