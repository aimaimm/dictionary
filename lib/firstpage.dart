import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.25,
                    left: MediaQuery.of(context).size.width * 0.26,
                    child: Text(
                      'Dictio',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 130,
                          fontFamily: 'DMDisplay'),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.38,
                    right: MediaQuery.of(context).size.width * 0.27,
                    child: Text(
                      'onary',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 130,
                          fontFamily: 'DMDisplay'),
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.8,
            // ),
            Divider(
              color: Color(0XFF707070).withOpacity(0.8),
              height: 23,
              indent: 35,
              endIndent: 35,
            ),
            Text(
              'Dictionaey For Learn',
              style: TextStyle(
                color: Color(0XFF707070),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
