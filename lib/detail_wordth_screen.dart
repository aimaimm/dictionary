import 'package:flutter/material.dart';

class Detail_wordTH_Screen extends StatefulWidget {
  const Detail_wordTH_Screen({Key? key}) : super(key: key);

  @override
  _Detail_wordTH_ScreenState createState() => _Detail_wordTH_ScreenState();
}

class _Detail_wordTH_ScreenState extends State<Detail_wordTH_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft:  Radius.circular(20.0),
            bottomRight:  Radius.circular(20.0),
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
          icon: Icon(Icons.arrow_back_ios_new_outlined),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: Container(
            padding: EdgeInsets.only(bottom: 25, right: 20, left: 20, top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ตามกฎหมาย',
                      style: TextStyle(fontSize: 36, color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '/ADV',
                      style: TextStyle(
                        color: Color(0XFFDBFF00),
                      ),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
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
        child: Padding(
          padding: const EdgeInsets.all(23.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'DEFINITION',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    children: [
                      Text(
                        'Aloha',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'สวัสดี',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                'EXAMPLE',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text(
                        'หนังสือลาออกของนายพรพจน์ยังไม่ทันมีผลตามกฎหมายเรื่องราวก็จบลงเสียก่อน'),
                  ),
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                'SYNONYMS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text('โดยชอบด้วยกฎหมาย'),
                  ),
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                'ANTONYMS',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text('-'),
                  ),
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                'TRANSLITERATE WORD',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text('according to the law; legally	'),
                  ),
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                'NOUN',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text('-'),
                  ),
                ],
              ),
              SizedBox(
                height: 23,
              ),
              Text(
                'NOTE',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Divider(),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text('-'),
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
