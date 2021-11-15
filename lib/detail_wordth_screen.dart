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
                  children: const [
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
        physics:const BouncingScrollPhysics(),
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
                    children: const [
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
                  const Flexible(
                    child: Text(
                        'หนังสือลาออกของนายพรพจน์ยังไม่ทันมีผลตามกฎหมายเรื่องราวก็จบลงเสียก่อน'),
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
                children: const [
                  CircleAvatar(
                    radius: 5,
                    backgroundColor: Colors.grey,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                    child: Text('โดยชอบด้วยกฎหมาย'),
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
                  const Flexible(
                    child: Text('-'),
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
                  const Flexible(
                    child: Text('according to the law; legally	'),
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
                  const Flexible(
                    child: Text('-'),
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
                  const Flexible(
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
