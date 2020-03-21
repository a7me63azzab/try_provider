import 'package:flutter/material.dart';
import 'package:loginprovider/src/pages/LoginPage/provider.dart';
import 'package:loginprovider/src/pages/LoginPage/view.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
          create: (_) => LoginProvider(), child: LoginPage()),
    );
  }
}
