import 'package:cup_of_coffee/src/steam_part.dart';
import 'package:flutter/material.dart';
// import 'package:logging/logging.dart';

Future<void> main() async {
  // Logger.root.level = Level.ALL;
  // Logger.root.onRecord.listen((record) {
  //   log('${record.level.name}: ${record.loggerName}: ${record.message}');
  // });

  runApp(const SteamPartDemo());
}

class SteamPartDemo extends StatelessWidget {
  const SteamPartDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
        textTheme: const TextTheme().copyWith(
          headlineMedium: const TextStyle(color: Colors.white),
          headlineSmall: const TextStyle(
              color: Colors.black26, fontSize: 14, fontStyle: FontStyle.italic),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            child: const SteamPart(
              width: 32,
              height: 102,
            ),
          ),
        ),
      ),
    );
  }
}
