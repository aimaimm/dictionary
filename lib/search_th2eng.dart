import 'dart:convert';

import 'package:dictionary/data.dart';
import 'package:dictionary/detail_wordth_screen.dart';
import 'package:dictionary/search_eng2th_screen.dart';
import 'package:dictionary/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Search_TH2Eng_Screen extends StatefulWidget {
  const Search_TH2Eng_Screen({
    Key? key,
    required this.th2eng,
    required this.eng2th,
    required this.wordofthedayeng2th,
    required this.wordofthedayth2eng,
  }) : super(key: key);

  final List th2eng;
  final List eng2th;
  final List wordofthedayeng2th;
  final List wordofthedayth2eng;

  @override
  _Search_TH2Eng_ScreenState createState() => _Search_TH2Eng_ScreenState();
}

class _Search_TH2Eng_ScreenState extends State<Search_TH2Eng_Screen> {
  var items = [];

  List history = [];

  void historywordth(item, context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? wordall = prefs.getString('k_word');

    if (wordall == null) {
      String json = jsonEncode(item);
      prefs.setString('k_word', json);
      // print(jsonDecode(prefs.getString('k_word').toString()).runtimeType);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Detail_wordTH_Screen(
            wordth: item,
            checkstate: false,
            json: "",
          ),
        ),
      );
    } else {
      var word = jsonDecode(wordall);
      // var test = word.runtimeType;
      print(word.runtimeType);
      if (word is Map<String, dynamic>) {
        if (word['id'] == item['id']) {
          word['count']++;
          history.add(word);
          String json = jsonEncode(history);
          prefs.setString('k_word', json);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Detail_wordTH_Screen(
                wordth: item,
                checkstate: false,
                json: "",
              ),
            ),
          );
        } else {
          history.add(word);
          history.add(item);

          String json = jsonEncode(history);
          prefs.setString('k_word', json);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Detail_wordTH_Screen(
                wordth: item,
                checkstate: false,
                json: "",
              ),
            ),
          );
        }
      } else if (word is List) {
        bool addNew = true;
        for (int i = 0; i < word.length; i++) {
          if (word[i]['id'] == item['id']) {
            word[i]['count']++;
            history.clear();
            history = word;
            String json = jsonEncode(history);
            prefs.setString('k_word', json);
            addNew = false;
            break;
          }
        }

        if (addNew == true) {
          history.clear();
          history = word;
          history.add(item);
        }
        String json = jsonEncode(history);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail_wordTH_Screen(
              wordth: item,
              checkstate: true,
              json: json,
            ),
          ),
        );
      }
    }
  }

  Future<void> clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  void initState() {
    items.addAll(widget.th2eng);
    super.initState();
  }

  void filterSearchResults(query) {
    List dummySearchList = [];
    dummySearchList.addAll(widget.th2eng);
    if (query.isNotEmpty) {
      List<dynamic> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item['tentry'] == query) {
          dummyListData.add(item);
        }
      });

      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(widget.th2eng);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        centerTitle: false,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
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
        actions: [
          Container(
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, left: 8, right: 1),
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'TH-ENG',
                style: TextStyle(color: Colors.black),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.white),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 8, right: 8, bottom: 8),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search_eng_Screen(
                        th2eng: widget.th2eng,
                        eng2th: widget.eng2th,
                        wordofthedayeng2th: widget.wordofthedayeng2th,
                        wordofthedayth2eng: widget.wordofthedayth2eng,
                      ),
                    ));
              },
              child: const Text(
                'ENG-TH',
                style: TextStyle(color: Colors.black),
              ),
              style: TextButton.styleFrom(backgroundColor: Colors.white),
            ),
          ),
        ],
      ),
      drawer: SideDrawer(
        eng2th: widget.eng2th,
        th2eng: widget.th2eng,
        wordofthedayeng2th: widget.wordofthedayeng2th,
        wordofthedayth2eng: widget.wordofthedayth2eng,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton(
                  onPressed: clear,
                  child: const Text(
                    'Dictionary',
                    style: TextStyle(
                        fontFamily: 'DMDisplay',
                        color: Colors.white,
                        fontSize: 36),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: TextField(
                    onChanged: (value) {
                      // print(value);

                      filterSearchResults(value);
                    },
                    decoration: InputDecoration(
                      hintText: 'Search word',
                      hintStyle: const TextStyle(fontSize: 13),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 0.0, style: BorderStyle.none)),
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 13, left: 8, right: 8),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          historywordth(items[index], context);

                          // var test = items[index];
                          // print(index);
                          // print(items[index].runtimeType);
                          // print(items[index]);
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Detail_wordTH_Screen(
                          //       wordth: items[index],
                          //       json: "",
                          //     ),
                          //   ),
                          // );
                        },
                        child: Card(
                          elevation: 0,
                          color: const Color(0XFFF9F9F9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListTile(
                            leading: Text('${items[index]['tentry']}'),
                            trailing:
                                const Icon(Icons.arrow_forward_ios_rounded),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
      //
    );
  }
}
