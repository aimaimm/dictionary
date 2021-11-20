import 'package:dictionary/detail_wordeng_screen.dart';
import 'package:dictionary/detail_wordth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Detail_MyVocab_Screen extends StatefulWidget {
  const Detail_MyVocab_Screen({Key? key, required this.mywordfav})
      : super(key: key);

  final List mywordfav;

  @override
  _Detail_MyVocab_ScreenState createState() => _Detail_MyVocab_ScreenState();
}

class _Detail_MyVocab_ScreenState extends State<Detail_MyVocab_Screen> {
  bool checkGenerate_word = false;
  List setword = [];
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

  void separateword() {
    if (widget.mywordfav[0]['groupword'] == [] ||
        widget.mywordfav[0]['groupword'].length == 0) {
      checkGenerate_word = false;
    } else {
      for (int i = 0; i < widget.mywordfav[0]['groupword'].length; i++) {
        setword.add(widget.mywordfav[0]['groupword'][i]);
      }
      setState(() {
        checkGenerate_word = true;
      });
    }
  }

  Widget check_textlang(item) {
    check_lang =
        RegExp("(?:^|\\s)(?:${keys.join('|')})(?!\\S)", caseSensitive: false);

    if (check_lang.hasMatch(item['eentry'])) {
      return Text('${item['eentry']}');
    } else {
      return Text('${item['tentry']}');
    }
  }

  @override
  void initState() {
    separateword();
    super.initState();
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
          preferredSize: Size.fromHeight(80.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    bottom: 25, right: 20, left: 20, top: 8),
                child: Text(
                  '${widget.mywordfav[0]['name']}',
                  style: const TextStyle(
                      fontFamily: 'DMDisplay',
                      fontSize: 36,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: checkGenerate_word
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.builder(
                  itemCount: setword.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        check_lang = RegExp(
                            "(?:^|\\s)(?:${keys.join('|')})(?!\\S)",
                            caseSensitive: false);

                        if (check_lang.hasMatch(setword[index]['eentry'])) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Detail_WordEng_Screen(
                                wordeng: setword[index],
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
                                wordth: setword[index],
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
                          leading: check_textlang(setword[index]),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded),
                        ),
                      ),
                    );
                  }),
            )
          : Container(),
    );
  }
}
