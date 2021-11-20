import 'dart:convert';

import 'package:dictionary/bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Detail_WordEng_Screen extends StatefulWidget {
  const Detail_WordEng_Screen({
    Key? key,
    required this.wordeng,
  }) : super(key: key);

  final wordeng;

  @override
  _Detail_WordEng_ScreenState createState() => _Detail_WordEng_ScreenState();
}

class _Detail_WordEng_ScreenState extends State<Detail_WordEng_Screen> {
  var favdata;
  bool canfav = true;
  bool changeheart = false;
  List isChecked = [];

  Future<void> savefavword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < favdata.length; i++) {
      if (isChecked[i] == true) {
        favdata[i]['groupword'].add(widget.wordeng);
      }
    }
    String favdataTosave = jsonEncode(favdata);
    prefs.setString('myvocab', favdataTosave);
    setState(() {
      changeheart = true;
    });
  }

  Future<dynamic> Favorite_sheet(BuildContext context) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context,
                void Function(void Function()) setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Save word to..',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  canfav
                      ? SizedBox(
                          height: 150,
                          child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: favdata.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: Checkbox(
                                    value: isChecked[index],
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked[index] = value!;
                                      });
                                    },
                                  ),
                                  title: Text('${favdata[index]['name']}'),
                                );
                              }),
                        )
                      : Container(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.1,
                    width: MediaQuery.of(context).size.width,
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          savefavword();
                          Navigator.pop(context);
                        });
                      },
                      child: const Text('Done'),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.black, primary: Colors.white),
                    ),
                  ),
                ],
              );
            },
          );
        });
  }

  String check_null(String mode) {
    if (mode == "esearch") {
      if (widget.wordeng['esearch'] == null) {
        return '-';
      } else {
        return widget.wordeng['esearch'];
      }
    } else if (mode == "eentry") {
      if (widget.wordeng['eentry'] == null) {
        return '-';
      } else {
        return widget.wordeng['eentry'];
      }
    } else if (mode == "tentry") {
      if (widget.wordeng['tentry'] == null) {
        return '-';
      } else {
        return widget.wordeng['tentry'];
      }
    } else if (mode == "ecat") {
      if (widget.wordeng['ecat'] == null) {
        return '-';
      } else {
        return widget.wordeng['ecat'];
      }
    } else if (mode == "esyn") {
      if (widget.wordeng['esyn'] == null) {
        return '-';
      } else {
        return widget.wordeng['esyn'];
      }
    } else if (mode == "ethai") {
      if (widget.wordeng['ethai'] == null) {
        return '-';
      } else {
        return widget.wordeng['ethai'];
      }
    } else {
      if (widget.wordeng['eant'] == null) {
        return '-';
      } else {
        return widget.wordeng['eant'];
      }
    }
  }

  Future<void> check_fav() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? myvacab = prefs.getString('myvocab');

    if (myvacab == null) {
      setState(() {
        canfav = false;
      });
    } else {
      favdata = jsonDecode(myvacab);

      setState(() {
        isChecked = List.filled(favdata.length, false);
        for (int i = 0; i < favdata.length; i++) {
          for (int n = 0; n < favdata[i]['groupword'].length; n++) {
            if (widget.wordeng['id'] == favdata[i]['groupword'][n]['id'] &&
                widget.wordeng['eentry'] == favdata[i]['groupword'][n]['eentry']) {
              changeheart = true;
              isChecked[i] = true;
            }
          }
        }

        canfav = true;
      });
    }
  }

  @override
  void initState() {
    check_fav();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
        title: const Text(
          'Back',
          style: TextStyle(fontSize: 15),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: Container(
            padding:
                const EdgeInsets.only(bottom: 25, right: 20, left: 20, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      check_null('esearch'),
                      style: TextStyle(
                          fontFamily: 'DMDisplay',
                          fontSize: size.width / 16,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '/ ${check_null('ecat')}',
                      style: const TextStyle(
                        color: Color(0XFFDBFF00),
                      ),
                    )
                  ],
                ),
                changeheart
                    ? IconButton(
                        onPressed: () {
                        },
                        icon: const Icon(
                          Icons.favorite,
                          size: 30,
                          color: Colors.white,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          Favorite_sheet(context);
                        },
                        icon: const Icon(
                          Icons.favorite_border_rounded,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'DEFINITION',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.01),
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text(
                      check_null('tentry'),
                      style: TextStyle(fontSize: size.width / 30),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
              const SizedBox(
                height: 23,
              ),
              const Text(
                'SYNONYMS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.01),
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    check_null('esyn'),
                    style: TextStyle(fontSize: size.width / 30),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              ),
              const SizedBox(
                height: 23,
              ),
              const Text(
                'ANTONYMS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.01),
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    check_null('eant'),
                    style: TextStyle(fontSize: size.width / 30),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
