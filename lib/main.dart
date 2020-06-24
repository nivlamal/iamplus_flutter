import 'package:flutter/material.dart';
import 'package:iamplus_flutter/UI/Home.dart';
import 'package:iamplus_flutter/data/repo.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Repo().init();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'I.AM+ Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}