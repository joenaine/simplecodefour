import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'generated/l10n.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SimpleCode'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              child: const Text('+')),
          FloatingActionButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              onPressed: () {
                setState(() {
                  counter--;
                });
              },
              child: const Text(
                '-',
                style: TextStyle(fontSize: 32),
              )),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${S.of(context).language}: ',
                style: const TextStyle(fontSize: 24),
              ),
              DropdownButton<String>(
                value: Intl.getCurrentLocale(),
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text(
                      S.of(context).english,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'ru_RU',
                    child: Text(
                      S.of(context).russian,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                ],
                onChanged: (value) async {
                  if (value == 'ru_RU') {
                    await S.load(const Locale('ru', 'RU'));
                    setState(() {});
                  } else if (value == 'en') {
                    await S.load(const Locale('en'));
                    setState(() {});
                  }
                },
              )
            ],
          ),
          Column(
            children: [
              Text(
                S.of(context).counterValue,
                style: const TextStyle(fontSize: 24),
              ),
              Text(
                counter.toString(),
                style: const TextStyle(fontSize: 36),
              ),
            ],
          ),
          const SizedBox.square()
        ],
      ),
    );
  }
}
