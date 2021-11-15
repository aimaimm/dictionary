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
      //  title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Sarabun',
        // primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
      // initialRoute: '/loaddataPage',
      // routes:  {
      //   '/loaddataPage' :(context)=>const FirstPage(),
      //   'homepage':(context)=>const WordOfDay_Screen(),
      //   '/search_eng2th':(context)=>const Search_eng_Screen(),
      //   '/search_th2th':(context)=>const Search_TH2Eng_Screen(),
      //   '/detail_eng2th':(context)=>const Detail_WordEng_Screen(),
      //   '/detail_th2eng':(context)=>const Detail_wordTH_Screen(),
      //   '/my_vocab_page':(context)=>const MyVocab_Screen(),
      //   '/detail_my_vocab':(context)=>const Detail_MyVocab_Screen(),

      // },
    );
  }
}
