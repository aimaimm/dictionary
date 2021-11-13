import 'package:dictionary/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flip_card/flip_card.dart';

class WordOfDay_Screen extends StatefulWidget {
  const WordOfDay_Screen({Key? key}) : super(key: key);

  @override
  _WordOfDay_ScreenState createState() => _WordOfDay_ScreenState();
}

class _WordOfDay_ScreenState extends State<WordOfDay_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Container(
          child: Builder(
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
      ),
      drawer: SideDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Dictionary',
            style: TextStyle(
                color: Colors.white, fontFamily: 'DMDisplay', fontSize: 46),
          ),
          Container(
            margin: EdgeInsets.all(28),
            height: 55,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search word',
                hintStyle: TextStyle(fontSize: 13),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 0.0, style: BorderStyle.none)),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 180,
                child: FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: Stack(alignment: Alignment.center, children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Abandon',
                          style: TextStyle(
                              fontFamily: 'DMDisplay',
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        Text('/ADV')
                      ],
                    ),
                  ]),
                  back: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.blue.shade800,
                        ),
                      ),
                      Text(
                        'ละทิ้ง',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 11,
              ),
              Container(
                width: 200,
                height: 180,
                child: FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: Stack(alignment: Alignment.center, children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'จากไป',
                          style: TextStyle(
                              fontFamily: 'DMDisplay',
                              color: Colors.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w600),
                        ),
                        Text('/Noun')
                      ],
                    ),
                  ]),
                  back: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.blue.shade800,
                        ),
                      ),
                      Text(
                        'Abandon',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
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
