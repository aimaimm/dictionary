import 'package:flutter/material.dart';

class Homepage_Screen extends StatefulWidget {
  const Homepage_Screen({Key? key}) : super(key: key);

  @override
  _Homepage_ScreenState createState() => _Homepage_ScreenState();
}

class _Homepage_ScreenState extends State<Homepage_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(),
    );
  }
}
