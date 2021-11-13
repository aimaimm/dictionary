import 'package:flutter/material.dart';

class Detail_WordEng_Screen extends StatefulWidget {
  const Detail_WordEng_Screen({Key? key}) : super(key: key);

  @override
  _Detail_WordEng_ScreenState createState() => _Detail_WordEng_ScreenState();
}

class _Detail_WordEng_ScreenState extends State<Detail_WordEng_Screen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(20.0),
            bottomRight: const Radius.circular(20.0),
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
                      'ability',
                      style: TextStyle(
                          fontFamily: 'DMDisplay',
                          fontSize: 36,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '/N',
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(
                    'พรสวรรค์ \nที่คงอยู่ตลอดไป',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 6,
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(
                    'talent (N.)',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 6,
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(
                    'inability',
                    style: TextStyle(fontSize: 16),
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
