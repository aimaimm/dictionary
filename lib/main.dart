import 'package:dictionary/bottomsheet.dart';
import 'package:dictionary/detail_myvocab_screen.dart';
import 'package:dictionary/detail_wordth_screen.dart';
import 'package:dictionary/detail_wordeng_screen.dart';
import 'package:dictionary/firstpage.dart';
import 'package:dictionary/history_screen.dart';
import 'package:dictionary/myvocab_screen.dart';
import 'package:dictionary/search_eng2th_screen.dart';
import 'package:dictionary/search_th2eng.dart';
import 'package:dictionary/wordofday_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Sarabun',
      ),
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
    );
  }
}
