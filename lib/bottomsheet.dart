import 'package:flutter/material.dart';

class ModalBottomSheet extends StatefulWidget {
  @override
  _ModalBottomSheetState createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Modal Bottom Sheet',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "MODAL BOTTOM SHEET EXAMPLE",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  letterSpacing: 0.4,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              onPressed: () {
                Favorite_sheet(context);
              },
              padding:
                  EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 15),
              color: Colors.pink,
              child: Text(
                'Click Me',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<dynamic> Favorite_sheet(BuildContext context) {
  bool? isChecked = false;
  return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(20.0),
          topRight: const Radius.circular(20.0),
        ),
      ),
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Save word to..',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                      
                    },
                  ),
                ],
              ),
            ),
            Divider(),
            ListTile(
              leading: Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  isChecked = value!;
                },
              ),
              title: new Text('My internet is 4G ...'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  isChecked = value!;
                },
              ),
              title: new Text('My internet is 4G ...'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  isChecked = value!;
                },
              ),
              title: new Text('Crazy in love'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Checkbox(
                value: isChecked,
                onChanged: (bool? value) {
                  isChecked = value!;
                },
              ),
              title: new Text('Hate some one'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Container(
              height: MediaQuery.of(context).size.width * 0.1,
              width: MediaQuery.of(context).size.width,
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Done'),
                style: TextButton.styleFrom(
                    backgroundColor: Colors.black, primary: Colors.white),
              ),
            ),
          ],
        );
      });
}
