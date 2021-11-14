import 'dart:convert';

import 'package:dictionary/data.dart';
import 'package:dictionary/sidebar_widget.dart';
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
          content: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Create',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                const Text('Create a vocabulary group'),
                const SizedBox(
                  height: 13,
                ),
                TextField(
                  controller: Category_txt,
                  decoration: const InputDecoration(
                    hintText: "Name group",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            primary: Colors.white),
                        child: const Text('OK'),
                        onPressed: () {
                          //print(Category_txt.text);
                          Navigator.pop(context);
                          setState(() {
                            category.add({'cat_name': Category_txt.text});
                            Category_txt.clear();
                          });
                          print(category);
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        titleSpacing: 0,
        centerTitle: true,
        title: const Text(
          'My Vocabulary',
          style: TextStyle(fontFamily: 'DMDisplay', fontSize: 24),
        ),
        leading: Builder(
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
      drawer: SideDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
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
                          content: const Text(
                              'Are you sure for delete this category?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Map deleted_cat = category.removeAt(index);
                                setState(() {
                                  category.insert(index, deleted_cat);
                                  Navigator.pop(context);
                                });
                              },
                              child: const Text(
                                'cancel',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  primary: Colors.white),
                              onPressed: () {
                                setState(() {
                                  category.removeAt(index);
                                  Navigator.pop(context);
                                });
                                // print(category);
                              },
                              child: const Text('OK'),
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
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              background: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                color: Colors.redAccent,
                child: const Icon(
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
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          borderSide: BorderSide(color: Colors.black, width: 2),
        ),
        onPressed: () {
          InputCategories(context);
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
