import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/login_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('T & E')),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: Text('Drawer Header')),
            ListTile(title: Text('Settings')),
            ListTile(title: Text('Lessons')),
            ListTile(
                title: Text('Logout'),
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                })
          ],
        ),
      ),
    );
  }

  void initState() {
    super.initState();
  }

  void dispose() {
    super.dispose();
  }
}
