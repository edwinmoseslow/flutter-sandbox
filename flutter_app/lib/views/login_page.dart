import 'package:flutter/material.dart';
import 'package:flutter_app/routes/route_path.dart';
import 'package:flutter_app/views/dashboard_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: InkWell(
          onTap: () {
            // route
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return DashboardPage();
            }));
          },
          child: Center(
            child: Text('Tap here to access'),
          ),
        ),
      ),
    );
  }
}
