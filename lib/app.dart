import 'package:flutter/material.dart';
import 'package:tonote/screens/home/home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AppRoot(),
    );
  }
}

class AppRoot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppRepository();
  }
}

class AppRepository extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBlocProvider();
  }
}

class AppBlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
