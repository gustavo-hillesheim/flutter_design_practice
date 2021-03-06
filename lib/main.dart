import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_design_practice/animated_fan_controller.dart';
import 'package:flutter_design_practice/christmas_app_onboarding.dart';
import 'package:flutter_design_practice/crypto_wallet.dart';

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
          aspectRatio: 9 / 18,
          child: ClipRect(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Design Practice',
              scrollBehavior: CustomScrollBehavior(),
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              routes: {
                '/': (_) => const Home(),
                '/crypto-wallet': (_) => const CryptoWallet(),
                '/christmas-app-onboarding': (_) =>
                    const ChristmasAppOnBoarding(),
                '/animated-fan-controller': (_) =>
                    const AnimatedFanController(),
              },
            ),
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
              onPressed: () => _push(context, '/crypto-wallet'),
              child: const Text('Crypto Wallet'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _push(context, '/christmas-app-onboarding'),
              child: const Text('Christmas App OnBoarding'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _push(context, '/animated-fan-controller'),
              child: const Text('Animated Fan Controller'),
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

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
