import 'package:diveloxx_flutter/screens/login_screen.dart';
import 'package:diveloxx_flutter/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final Future<void> _fakeWait = Future.delayed(Duration(seconds: 5));

  Future<List> _initAppData() {
    return Future.wait([
      _initialization,
      _fakeWait,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initAppData(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          // TODO: Display error
          return throw UnimplementedError('Error during initialization');
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Diveloxx',
            home: LoginScreen(),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          home: SplashScreen(),
        );
      },
    );
  }
}
