import 'package:flutter/material.dart';
import 'loading_screen.dart';
import 'screen.dart';
import 'main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: !true,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Screen(),
    );
  }
}
