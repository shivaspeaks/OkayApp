import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            const CircularProgressIndicator(),
            const SizedBox(
              height: 10,
            ),
            const Text('Loading...'),
          ],
        ),
      ),
    );
  }
}
