import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics:const NeverScrollableScrollPhysics(),
        padding:const EdgeInsets.all(10),
        children: <Widget>[
          DrawerHeader(
            child: Column(
              //mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icon/book3.png',
                  width: 70,
                  height: 70,
                ),
               const Text(
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
            leading:const Icon(Icons.home_outlined),
            title:const Text('Home'),
            onTap: () => {},
          ),
          ListTile(
            leading:const Icon(Icons.search),
            title:const Text('Search'),
            onTap: () => {},
          ),
          ListTile(
            leading:const Icon(Icons.favorite_outline),
            title:const Text('My vocabulary'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading:const Icon(Icons.history),
            title:const Text('History'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
