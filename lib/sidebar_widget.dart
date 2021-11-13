import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(10),
        children: <Widget>[
          DrawerHeader(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    'assets/icon/book3.png',
                    width: 70,
                    height: 70,
                  ),
                ),
                Text(
                  'Dictionary',
                  style: TextStyle(fontFamily: 'DMDisplay', fontSize: 18),
                )
              ],
            ),
            // decoration: BoxDecoration(
            //  border:
            // ),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.favorite_outline),
            title: Text('My vocabulary'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('History'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
