import 'dart:async';

import 'package:flutter/material.dart';

import 'core/helpers/page_routes.dart';
import 'features/sign_in/pages/sign_in_page.dart';

class SplashPage extends StatefulWidget {
  static const String route = 'splash';
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  startSplashScreen() async {
    const duration = Duration(seconds: 1);

    return Timer(duration, () {
      PageRoutes.pushReplacement(LoginPage.new);
    });
  }

  @override
  void initState() {
    super.initState();
    startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  "assets/app_icon.png",
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}
