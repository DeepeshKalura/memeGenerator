import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1,
            "assets/usedinMemeApp/splashScreenDmeme.gif",
          ),
        ],
      ),
    );
  }
}
