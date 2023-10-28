import 'package:flutter/material.dart';
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
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                      padding: const EdgeInsets.only(top: 7, bottom: 7),
                      child: Row(children: [
                        Icon(
                          Icons.arrow_back,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          item.nama,
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ])),
                ),
                Image.asset(
                  item.linkGambar,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 7,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.deskripsi),
                    const SizedBox(
                      height: 7,
                    ),
                    Text("${item.harga}"),
                  ],
                ),
              ],
            )),
      )));
}
