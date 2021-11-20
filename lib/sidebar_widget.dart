import 'dart:async';

import 'package:dictionary/data.dart';
import 'package:dictionary/db_dic.dart';
import 'package:dictionary/history_screen.dart';
import 'package:dictionary/myvocab_screen.dart';
import 'package:dictionary/search_th2eng.dart';
import 'package:dictionary/wordofday_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideDrawer extends StatefulWidget {
  SideDrawer(
      {Key? key,
      required this.th2eng,
      required this.eng2th,
      required this.wordofthedayeng2th,
      required this.wordofthedayth2eng})
      : super(key: key);

  final List th2eng;
  final List eng2th;
  final List wordofthedayeng2th;
  final List wordofthedayth2eng;

  @override
  State<SideDrawer> createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  final db_dic _helper = db_dic();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          DrawerHeader(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon/book3.png',
                  width: 70,
                  height: 70,
                ),
                const Text(
                  'Dictionary',
                  style: TextStyle(fontFamily: 'DMDisplay', fontSize: 18),
                )
              ],
            ),
            // decoration: BoxDecoration(
            //  border:
            // ),
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Home'),
            onTap: () => {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WordOfDay_Screen(
                      eng2th: widget.eng2th,
                      th2eng: widget.th2eng,
                      wordofthedayeng2th: widget.wordofthedayeng2th,
                      wordofthedayth2eng: widget.wordofthedayth2eng,
                      lang_mode: 0,
                    ),
                  ),
                  (route) => false)
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => WordOfDay_Screen(
              //       eng2th: widget.eng2th,
              //       th2eng: widget.th2eng,
              //       wordofthedayeng2th: widget.wordofthedayeng2th,
              //       wordofthedayth2eng: widget.wordofthedayth2eng,
              //       lang_mode: 0,
              //     ),
              //   ),
              // ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.search),
            title: const Text('Search'),
            onTap: () => {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Search_TH2Eng_Screen(
                      eng2th: widget.eng2th,
                      th2eng: widget.th2eng,
                      wordofthedayeng2th: widget.wordofthedayeng2th,
                      wordofthedayth2eng: widget.wordofthedayth2eng,
                    ),
                  ),
                  (route) => false)
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Search_TH2Eng_Screen(
              //       eng2th: widget.eng2th,
              //       th2eng: widget.th2eng,
              //       wordofthedayeng2th: widget.wordofthedayeng2th,
              //       wordofthedayth2eng: widget.wordofthedayth2eng,
              //     ),
              //   ),
              // ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite_outline),
            title: const Text('My vocabulary'),
            onTap: () => {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyVocab_Screen(
                      eng2th: widget.eng2th,
                      th2eng: widget.th2eng,
                      wordofthedayeng2th: widget.wordofthedayeng2th,
                      wordofthedayth2eng: widget.wordofthedayth2eng,
                    ),
                  ),
                  (route) => false)
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => MyVocab_Screen(
              //       eng2th: widget.eng2th,
              //       th2eng: widget.th2eng,
              //       wordofthedayeng2th: widget.wordofthedayeng2th,
              //       wordofthedayth2eng: widget.wordofthedayth2eng,
              //     ),
              //   ),
              // ),
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text('History'),
            onTap: () => {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => History_Screen(
                      eng2th: widget.eng2th,
                      th2eng: widget.th2eng,
                      wordofthedayeng2th: widget.wordofthedayeng2th,
                      wordofthedayth2eng: widget.wordofthedayth2eng,
                    ),
                  ),
                  (route) => false)
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => History_Screen(
              //       eng2th: widget.eng2th,
              //       th2eng: widget.th2eng,
              //       wordofthedayeng2th: widget.wordofthedayeng2th,
              //       wordofthedayth2eng: widget.wordofthedayth2eng,
              //     ),
              //   ),
              // ),
            },
          ),
        ],
      ),
    );
  }
}
