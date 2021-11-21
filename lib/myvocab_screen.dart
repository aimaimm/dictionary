import 'dart:convert';

import 'package:dictionary/data.dart';
import 'package:dictionary/detail_myvocab_screen.dart';
import 'package:dictionary/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyVocab_Screen extends StatefulWidget {
  const MyVocab_Screen(
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
  _MyVocab_ScreenState createState() => _MyVocab_ScreenState();
}

class _MyVocab_ScreenState extends State<MyVocab_Screen> {
  TextEditingController Category_txt = TextEditingController();
  bool catspawn = false;
  var myvacab;

  Future<void> saveAction(index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    myvacab.removeAt(index);
    String saveAction = jsonEncode(myvacab);
    prefs.setString('myvocab', saveAction);
  }

  Future<void> InputCategories(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Create',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                const Text('Create a vocabulary group'),
                const SizedBox(
                  height: 13,
                ),
                TextField(
                  controller: Category_txt,
                  decoration: const InputDecoration(
                    hintText: "Name group",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            primary: Colors.white),
                        child: const Text('OK'),
                        onPressed: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          if (myvacab == null || myvacab == []) {
                            List createmyvocab = [
                              {
                                'id': 1,
                                'name': Category_txt.text,
                                'groupword': [],
                              },
                            ];
                            myvacab = [];
                            myvacab.add(createmyvocab[0]);
                            String savefav = jsonEncode(createmyvocab);
                            prefs.setString('myvocab', savefav);
                          } else {
                            List createmyvocab = [
                              {
                                'id': (myvacab.length + 1),
                                'name': Category_txt.text,
                                'groupword': [],
                              },
                            ];
                            myvacab.add(createmyvocab[0]);
                            String savefav = jsonEncode(myvacab);
                            prefs.setString('myvocab', savefav);
                          }

                          setState(() {
                            catspawn = true;

                            Category_txt.clear();
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  int checklength() {
    if (myvacab == null) {
      return 0;
    } else {
      return myvacab.length;
    }
  }

  Future<void> connectLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    myvacab = prefs.get('myvocab');

    if (myvacab == null || myvacab == []) {
      print('null');
    } else {
      myvacab = jsonDecode(myvacab);

      setState(() {
        catspawn = true;
      });
    }
  }

  @override
  void initState() {
    connectLocal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        titleSpacing: 0,
        centerTitle: true,
        title: const Text(
          'My Vocabulary',
          style: TextStyle(fontFamily: 'DMDisplay', fontSize: 24),
        ),
        leading: Builder(
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
      ),
      drawer: SideDrawer(
        eng2th: widget.eng2th,
        th2eng: widget.th2eng,
        wordofthedayeng2th: widget.wordofthedayeng2th,
        wordofthedayth2eng: widget.wordofthedayth2eng,
      ),
      body: catspawn
          ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: checklength(),
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      setState(() {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Are you sure?'),
                                content: const Text(
                                    'Are you sure for delete this category?'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'cancel',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        primary: Colors.white),
                                    onPressed: () {
                                      setState(() {
                                        saveAction(index);

                                        catspawn = true;
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            });
                      });
                    },
                    child: InkWell(
                      onTap: () {
                        List fortranData = [];
                        if (myvacab is Map) {
                          fortranData.add(myvacab);
                        } else if (myvacab is List) {
                          fortranData.add(myvacab[index]);
                        }
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Detail_MyVocab_Screen(
                              mywordfav: fortranData,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.black,
                        child: ListTile(
                          title: Text(
                            '${myvacab[index]['name']}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    background: Container(
                      padding: const EdgeInsets.all(8),
                      margin: const EdgeInsets.all(8),
                      color: Colors.redAccent,
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    direction: DismissDirection.endToStart,
                  );
                },
              ),
            )
          : Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        onPressed: () {
          InputCategories(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
