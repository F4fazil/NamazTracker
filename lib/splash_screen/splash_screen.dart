import 'package:flutter/material.dart';

import '../navigation/routes.dart';

class SplashScreen extends StatefulWidget {
  static MaterialPage page() {
    return MaterialPage(
      name: Routes.splashPath,
      key: ValueKey(Routes.splashPath),
      child: const SplashScreen(),
    );
  }

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //CHANGE  haboIcon to NamazIcon
            Container(
              height: 400,
              width: 200,
              child: Image.asset(
                'assets/images/icon.png',
                width: 72,
              ),
            ),
            //chnage name in splash screen
            Text(
              "Namaz Tracker",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}
