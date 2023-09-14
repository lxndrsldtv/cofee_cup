import 'dart:developer';

import 'package:cup_of_coffee/cup_of_coffee.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

Future<void> main() async {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log('${record.level.name}: ${record.loggerName}: ${record.message}');
  });

  runApp(const CupOfCoffee());
}

class CupOfCoffee extends StatelessWidget {
  const CupOfCoffee({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        textTheme: const TextTheme().copyWith(
          headlineMedium: const TextStyle(color: Colors.white),
          headlineSmall: const TextStyle(
              color: Colors.black26, fontSize: 14, fontStyle: FontStyle.italic),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Cup of Coffee Demo'),
        ),
        body: const Steam(),
      ),
    );
  }
}
