import 'package:dictionary/search_eng2th_screen.dart';
import 'package:dictionary/search_th2eng.dart';
import 'package:dictionary/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flip_card/flip_card.dart';

class WordOfDay_Screen extends StatefulWidget {
  const WordOfDay_Screen(
      {Key? key,
      required this.eng2th,
      required this.th2eng,
      required this.wordofthedayeng2th,
      required this.wordofthedayth2eng,
      required this.lang_mode})
      : super(key: key);

  final List eng2th;
  final List th2eng;
  final List wordofthedayeng2th;
  final List wordofthedayth2eng;
  final int lang_mode;

  @override
  _WordOfDay_ScreenState createState() => _WordOfDay_ScreenState();
}

class _WordOfDay_ScreenState extends State<WordOfDay_Screen> {
  // @override
  // void initState() {
  //   print(widget.eng2th.runtimeType);
  //   print(widget.th2eng.runtimeType);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
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
      ),
      drawer: SideDrawer(
        eng2th: widget.eng2th,
        th2eng: widget.th2eng,
        wordofthedayeng2th: widget.wordofthedayeng2th,
        wordofthedayth2eng: widget.wordofthedayth2eng,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Dictionary',
            style: TextStyle(
                color: Colors.white, fontFamily: 'DMDisplay', fontSize: 46),
          ),
          Container(
            margin: const EdgeInsets.all(28),
            height: 55,
            child: TextField(
              onTap: () {
                if (widget.lang_mode == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search_TH2Eng_Screen(
                        th2eng: widget.th2eng,
                        eng2th: widget.eng2th,
                        wordofthedayeng2th: widget.wordofthedayeng2th,
                        wordofthedayth2eng: widget.wordofthedayth2eng,
                      ),
                    ),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Search_eng_Screen(
                        th2eng: widget.th2eng,
                        eng2th: widget.eng2th,
                        wordofthedayeng2th: widget.wordofthedayeng2th,
                        wordofthedayth2eng: widget.wordofthedayth2eng,
                      ),
                    ),
                  );
                }
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.425,
                height: MediaQuery.of(context).size.width * 0.38,
                child: FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: Stack(alignment: Alignment.center, children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '${widget.wordofthedayeng2th[0]['esearch']}',
                            style: TextStyle(
                                fontFamily: 'DMDisplay',
                                color: Colors.black,
                                fontSize: size.width / 19,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text('/ ${widget.wordofthedayeng2th[0]['ecat']}')
                      ],
                    ),
                  ]),
                  back: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.blue.shade800,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          '${widget.wordofthedayeng2th[0]['tentry']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width / 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.425,
                height: MediaQuery.of(context).size.width * 0.38,
                child: FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: Stack(alignment: Alignment.center, children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '${widget.wordofthedayth2eng[0]['tentry']}',
                            style: TextStyle(
                                fontFamily: 'DMDisplay',
                                color: Colors.black,
                                fontSize: size.width / 24,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Text('/ ${widget.wordofthedayth2eng[0]['tcat']}')
                      ],
                    ),
                  ]),
                  back: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          color: Colors.blue.shade800,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          '${widget.wordofthedayth2eng[0]['eentry']}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width / 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
