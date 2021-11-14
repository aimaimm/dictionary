import 'package:dictionary/data.dart';
import 'package:dictionary/sidebar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class History_Screen extends StatefulWidget {
  const History_Screen({Key? key}) : super(key: key);

  @override
  _History_ScreenState createState() => _History_ScreenState();
}

class _History_ScreenState extends State<History_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight:  Radius.circular(20.0),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        titleSpacing: 0,
        centerTitle: false,
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
        bottom: PreferredSize(
          preferredSize:const Size.fromHeight(80.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding:
                   const EdgeInsets.only(bottom: 25, right: 20, left: 20, top: 8),
                child:const Text(
                  'History',
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
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          //physics: ScrollPhysics(),
          physics:const BouncingScrollPhysics(),
          children: [
           const Text(
              'Most Search',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          const  SizedBox(
              height: 10,
            ),
            ListView.builder(
                primary: false,
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
                itemCount: most.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 0,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Text('${most[index]['name']}'),
                      trailing:const Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  );
                }),
          const  SizedBox(
              height: 10,
            ),
           const Text(
              'History',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
           const SizedBox(
              height: 10,
            ),
            ListView.builder(
                primary: false,
                shrinkWrap: true,
                physics:const NeverScrollableScrollPhysics(),
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
                })
          ],
        ),
      ),
    );
  }
}
