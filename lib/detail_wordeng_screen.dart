import 'package:flutter/material.dart';

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
          preferredSize: Size.fromHeight(120.0),
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
                      style: const TextStyle(
                          fontFamily: 'DMDisplay',
                          fontSize: 36,
                          color: Colors.white),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '/${check_null('ecat')}',
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
                    margin: const EdgeInsets.only(top: 8),
                    child: const CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    check_null('tentry'),
                    style: const TextStyle(fontSize: 16),
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
                    margin: const EdgeInsets.only(top: 8),
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
                    style: const TextStyle(fontSize: 16),
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
                    margin: const EdgeInsets.only(top: 8),
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
                    style: const TextStyle(fontSize: 16),
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
