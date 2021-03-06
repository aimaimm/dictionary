import 'dart:async';
import 'dart:convert';

import 'package:dictionary/db_dic.dart';
import 'package:dictionary/wordofday_screen.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final db_dic _helper = db_dic();

  @override
  void initState() {
    _helper.openDB();

    Timer(const Duration(seconds: 1), () async {
      List raweng2th = await _helper.getAllDataEng2th();
      List rawth2eng = await _helper.getAllDatath2Eng();
      List wordofthedayeng2th = await _helper.wordofthedayeng2th();
      List wordofthedayth2eng = await _helper.worofthedayth2eng();

      List eng2th = [];
      List th2eng = [];
      for (int i = 0; i < raweng2th.length; i++) {
        Map dummydata = Map.from(raweng2th[i]);
        dummydata.addAll({'count': 0});
        dummydata.addAll({'fav': false});
        eng2th.add(dummydata);
      }
      for (int i = 0; i < rawth2eng.length; i++) {
        Map dummydata = Map.from(rawth2eng[i]);
        dummydata.addAll({'count': 0});
        dummydata.addAll({'fav': false});
        th2eng.add(dummydata);

      }

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => WordOfDay_Screen(
                    eng2th: eng2th,
                    th2eng: th2eng,
                    lang_mode: 0,
                    wordofthedayeng2th: wordofthedayeng2th,
                    wordofthedayth2eng: wordofthedayth2eng,
                  )),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.255,
                    left: MediaQuery.of(context).size.width * 0.265,
                    child: const Text(
                      'Dictio',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 130,
                          fontFamily: 'DMDisplay'),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.385,
                    right: MediaQuery.of(context).size.width * 0.27,
                    child: const Text(
                      'onary',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 130,
                          fontFamily: 'DMDisplay'),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              color: const Color(0XFF707070).withOpacity(0.8),
              height: 23,
              indent: 35,
              endIndent: 35,
            ),
            const Text(
              'Dictionaey For Learn',
              style: TextStyle(
                color: Color(0XFF707070),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
