import 'dart:convert';

import 'package:dictionary/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyVocab_Screen extends StatefulWidget {
  const MyVocab_Screen({Key? key}) : super(key: key);

  @override
  _MyVocab_ScreenState createState() => _MyVocab_ScreenState();
}

class _MyVocab_ScreenState extends State<MyVocab_Screen> {
  TextEditingController Category_txt = TextEditingController();

  Future<void> InputCategories(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Create',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                Text('Create a vocabulary group'),
                SizedBox(
                  height: 13,
                ),
                TextField(
                  controller: Category_txt,
                  decoration: InputDecoration(
                    hintText: "Name group",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: Text('Cancel'),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            primary: Colors.white),
                        child: Text('OK'),
                        onPressed: () {
                          //print(Category_txt.text);
                          Navigator.pop(context);
                          setState(() {
                            // utf8.decode(Category_txt.text.);
                            category.add({'cat_name': Category_txt.text});
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: const Radius.circular(20.0),
            bottomRight: const Radius.circular(20.0),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        titleSpacing: 0,
        centerTitle: true,
        title: Text(
          'My Vocabulary',
          style: TextStyle(fontFamily: 'DMDisplay', fontSize: 24),
        ),
        leading: Container(
          //color: Colors.red,
          //padding: EdgeInsets.symmetric(horizontal: 0),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: category.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                setState(() {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Are you sure?'),
                          content:
                              Text('Are you sure for delete this category?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Map deleted_cat = category.removeAt(index);
                                setState(() {
                                  category.insert(index, deleted_cat);
                                  Navigator.pop(context);
                                });
                              },
                              child: Text('cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  category.removeAt(index);
                                  Navigator.pop(context);
                                });
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      });
                });
              },
              child: Card(
                color: Colors.black,
                child: ListTile(
                  title: Text(
                    '${category[index]['cat_name']}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              background: Container(
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.all(8),
                color: Colors.redAccent,
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              direction: DismissDirection.endToStart,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        onPressed: () {
          InputCategories(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
