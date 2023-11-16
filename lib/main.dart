import 'package:acetaxi/login.dart';
import 'package:acetaxi/signup.dart';
import 'package:acetaxi/welcomePage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'forgotpassword.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Ace Taxi';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: _title, home: welcomePage());
  }
}
