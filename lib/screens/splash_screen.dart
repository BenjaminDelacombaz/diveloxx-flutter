import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 64,
          width: 64,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
