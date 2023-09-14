import 'package:cup_of_coffee/src/white_cup_with_coffee.dart';
import 'package:flutter/material.dart';
// import 'package:logging/logging.dart';

Future<void> main() async {
  // Logger.root.level = Level.ALL;
  // Logger.root.onRecord.listen((record) {
  //   log('${record.level.name}: ${record.loggerName}: ${record.message}');
  // });

  runApp(const CupWithCoffee());
}

class CupWithCoffee extends StatelessWidget {
  const CupWithCoffee({super.key});

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
      home: const Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: SizedBox()),
              Flexible(
                  child: WhiteCupWithCoffee(cupWidth: 200, cupTopHeight: 50)),
              Flexible(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
}
