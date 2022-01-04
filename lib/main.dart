import 'package:flutter/material.dart';
import 'package:flutter_design_practice/cryptofo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Center(
        // Keeps the app always at 9 / 16 aspect ratio so
        // we don't need to worry about responsiveness
        child: AspectRatio(
          aspectRatio: 9 / 16,
          child: MaterialApp(
            title: 'Flutter Design Practice',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routes: {
              '/': (_) => const Home(),
              '/cryptofo': (_) => const Cryptofo(),
            },
          ),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Design Practice')),
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _push(context, '/cryptofo'),
              child: const Text('Cryptofo'),
            ),
          ],
        ),
      ),
    );
  }

  void _push(BuildContext context, String route) {
    Navigator.of(context).pushNamed(route);
  }
}
