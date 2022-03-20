import 'package:flutter/material.dart';

import '../../utility/common_widgets/AppVersionView.dart';
import '../../utility/navigator/navigation_pages.dart';
import '../../utility/navigator/navigator.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  _createHeader(),
                  _createDrawerItem(
                      icon: Icons.contacts,
                      text: 'Home',
                      onTap: () {
                        Navigator.of(context).pop();
                        //Navigator.of(context, rootNavigator: true).pop();
                      }),
                  _createDrawerItem(
                      icon: Icons.event,
                      text: 'Settings',
                      onTap: () {
                        AppNavigator.instance.navigateTo(
                            name: NavigationPages.kComingSoonPage,
                            arguments: 'Settings');
                      }),
                  _createDrawerItem(
                      icon: Icons.note,
                      text: 'About Us',
                      onTap: () {
                        AppNavigator.instance.navigateTo(
                            name: NavigationPages.kComingSoonPage,
                            arguments: 'About Us');
                      }),
                ],
              ),
            ),
            AppVersion(),
          ],
        ),
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(color: Colors.blueAccent),
        child: Stack(children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text("Flutter Sample",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ]));
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
