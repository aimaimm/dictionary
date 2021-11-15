import 'package:dictionary/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Detail_MyVocab_Screen extends StatefulWidget {
  const Detail_MyVocab_Screen({Key? key}) : super(key: key);

  @override
  _Detail_MyVocab_ScreenState createState() => _Detail_MyVocab_ScreenState();
}

class _Detail_MyVocab_ScreenState extends State<Detail_MyVocab_Screen> {
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
        centerTitle: false,
        title: const Text(
          'Back',
          style: TextStyle(fontSize: 15),
        ),
        leading: IconButton(
          icon:const Icon(Icons.arrow_back_ios_new_outlined),
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
                padding:
                  const  EdgeInsets.only(bottom: 25, right: 20, left: 20, top: 8),
                child:const Text(
                  'Crazy in love',
                  style: TextStyle(
                      fontFamily: 'DMDisplay',
                      fontSize: 36,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView.builder(
            itemCount: History.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Text('${History[index]['name']}'),
                  trailing:const Icon(Icons.arrow_forward_ios_rounded),
                ),
              );
            }),
      ),
    );
  }
}
