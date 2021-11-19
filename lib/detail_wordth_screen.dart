import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Detail_wordTH_Screen extends StatefulWidget {
  const Detail_wordTH_Screen(
      {Key? key,
      required this.wordth,
      required this.json,
      required this.checkstate})
      : super(key: key);

  final wordth;
  final String json;
  final bool checkstate;

  @override
  _Detail_wordTH_ScreenState createState() => _Detail_wordTH_ScreenState();
}

class _Detail_wordTH_ScreenState extends State<Detail_wordTH_Screen> {
  String check_null(String mode) {
    if (mode == "tsearch") {
      if (widget.wordth['tsearch'] == null) {
        return '-';
      } else {
        return widget.wordth['tsearch'];
      }
    } else if (mode == "tentry") {
      if (widget.wordth['tentry'] == null) {
        return '-';
      } else {
        return widget.wordth['tentry'];
      }
    } else if (mode == "eentry") {
      if (widget.wordth['eentry'] == null) {
        return '-';
      } else {
        return widget.wordth['eentry'];
      }
    } else if (mode == "tcat") {
      if (widget.wordth['tcat'] == null) {
        return '-';
      } else {
        return widget.wordth['tcat'];
      }
    } else if (mode == "tsyn") {
      if (widget.wordth['tsyn'] == null) {
        return '-';
      } else {
        return widget.wordth['tsyn'];
      }
    } else if (mode == "tsample") {
      if (widget.wordth['tsample'] == null) {
        return '-';
      } else {
        return widget.wordth['tsample'];
      }
    } else if (mode == "tant") {
      if (widget.wordth['tant'] == null) {
        return '-';
      } else {
        return widget.wordth['tant'];
      }
    } else if (mode == "tdef") {
      if (widget.wordth['tdef'] == null) {
        return '-';
      } else {
        return widget.wordth['tdef'];
      }
    } else if (mode == "tenglish") {
      if (widget.wordth['tenglish'] == null) {
        return '-';
      } else {
        return widget.wordth['tenglish'];
      }
    } else if (mode == "tnum") {
      if (widget.wordth['tnum'] == null) {
        return '-';
      } else {
        return widget.wordth['tnum'];
      }
    } else {
      if (widget.wordth['notes'] == null) {
        return '-';
      } else {
        return widget.wordth['notes'];
      }
    }
  }

  @override
  void initState() {
    saveword();
    super.initState();
  }

  Future<void> saveword() async {
    if (widget.checkstate == true) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('k_word', widget.json);
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
                      check_null("tentry"),
                      style: const TextStyle(fontSize: 36, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '/${check_null("tcat")}',
                      style: const TextStyle(
                        color: Color(0XFFDBFF00),
                      ),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border_rounded,
                      size: 30,
                      color: Colors.white,
                    ))
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
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 21),
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text(
                        check_null("eentry"),
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Text(
                        check_null('tdef'),
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 23,
              ),
              const Text(
                'EXAMPLE',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 21),
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text(check_null('tsample')),
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
                children: [
                  const CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.grey,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text(check_null('tsyn')),
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
                children: [
                  Container(
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text(check_null('tant')),
                  ),
                ],
              ),
              const SizedBox(
                height: 23,
              ),
              const Text(
                'TRANSLITERATE WORD',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                children: [
                  Container(
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text(check_null('tenglish')),
                  ),
                ],
              ),
              const SizedBox(
                height: 23,
              ),
              const Text(
                'NOUN',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                children: [
                  Container(
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text(check_null('tnum')),
                  ),
                ],
              ),
              const SizedBox(
                height: 23,
              ),
              const Text(
                'NOTE',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Divider(),
              Row(
                children: [
                  Container(
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text(check_null('notes')),
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
