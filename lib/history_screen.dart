import 'dart:convert';

import 'package:dictionary/data.dart';
import 'package:dictionary/detail_wordeng_screen.dart';
import 'package:dictionary/detail_wordth_screen.dart';
import 'package:dictionary/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History_Screen extends StatefulWidget {
  const History_Screen(
      {Key? key,
      required this.eng2th,
      required this.th2eng,
      required this.wordofthedayeng2th,
      required this.wordofthedayth2eng})
      : super(key: key);

  final List eng2th;
  final List th2eng;
  final List wordofthedayeng2th;
  final List wordofthedayth2eng;

  @override
  _History_ScreenState createState() => _History_ScreenState();
}

class _History_ScreenState extends State<History_Screen> {
  String? word;
  bool loadWord = true;
  var items;
  List mostword = [];
  var keys = [
    'a',
    'b',
    'c',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'x',
    'y',
    'z',
  ];
  var check_lang;

  void mostSearch() {
    for (int i = 0; i < items.length; i++) {
      mostword.add(items[i]);
    }
    mostword.sort((a, b) => b['count'].compareTo(a['count']));
    for (int i = 0; i < mostword.length; i++) {
      print(mostword[i]);
    }
  }

  int generatemostSearch() {
    if (mostword.length >= 5) {
      return 5;
    } else {
      return mostword.length;
    }
  }

  Widget textMost(item) {
    check_lang =
        RegExp("(?:^|\\s)(?:${keys.join('|')})(?!\\S)", caseSensitive: false);

    if (check_lang.hasMatch(item['eentry'])) {
      return Text('${item['eentry']}');
    } else {
      return Text('${item['tentry']}');
    }
  }

  @override
  void historyword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    word = prefs.getString('k_word');
    if (word == null) {
    } else {
      items = jsonDecode(word!);
      if (items is List) {
        items = List.from(items.reversed);
      } else {
        List dummydata = [];
        dummydata.add(items);
        items = dummydata;
      }
      mostSearch();
      setState(() {
        loadWord = false;
      });
    }
  }

  @override
  void initState() {
    historyword();
    super.initState();
  }

  Widget texthistory(item) {
    check_lang =
        RegExp("(?:^|\\s)(?:${keys.join('|')})(?!\\S)", caseSensitive: false);

    if (check_lang.hasMatch(item['eentry'])) {
      return Text('${item['eentry']}');
    } else {
      return Text('${item['tentry']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        titleSpacing: 0,
        centerTitle: false,
        title: Builder(
          builder: (context) => IconButton(
            icon: SvgPicture.asset(
              "assets/icon/menubar.svg",
              color: Colors.white,
              height: 50,
              width: 50,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    bottom: 25, right: 20, left: 20, top: 8),
                child: const Text(
                  'History',
                  style: TextStyle(
                      fontFamily: 'DMDisplay',
                      fontSize: 36,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: SideDrawer(
        eng2th: widget.eng2th,
        th2eng: widget.th2eng,
        wordofthedayeng2th: widget.wordofthedayeng2th,
        wordofthedayth2eng: widget.wordofthedayth2eng,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            const Text(
              'Most Search',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            loadWord
                ? const SizedBox(
                    height: 15,
                  )
                : ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: generatemostSearch(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          check_lang = RegExp(
                              "(?:^|\\s)(?:${keys.join('|')})(?!\\S)",
                              caseSensitive: false);

                          if (check_lang.hasMatch(items[index]['eentry'])) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detail_WordEng_Screen(
                                  wordeng: items[index],
                                ),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detail_wordTH_Screen(
                                  checkstate: false,
                                  json: '',
                                  wordth: items[index],
                                ),
                              ),
                            );
                          }
                        },
                        child: Card(
                          elevation: 0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: textMost(mostword[index]),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      );
                    }),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'History',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            loadWord
                ? Container()
                : ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          check_lang = RegExp(
                              "(?:^|\\s)(?:${keys.join('|')})(?!\\S)",
                              caseSensitive: false);

                          if (check_lang.hasMatch(items[index]['eentry'])) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detail_WordEng_Screen(
                                  wordeng: items[index],
                                ),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detail_wordTH_Screen(
                                  checkstate: false,
                                  json: '',
                                  wordth: items[index],
                                ),
                              ),
                            );
                          }
                        },
                        child: Card(
                          elevation: 0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: texthistory(items[index]),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      );
                    })
          ],
        ),
      ),
    );
  }
}
