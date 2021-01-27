import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with TickerProviderStateMixin<LoginPage> {
  // const ProfilePage({Key key, this.destination}) : super(key: key);

  // final Destination destination;

  // int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // _faders =
    //     allDestinations.map<AnimationController>((Destination destination) {
    //   return AnimationController(
    //       vsync: this, duration: Duration(milliseconds: 200));
    // }).toList();
    // _faders[_currentIndex].value = 1.0;
    // _destinationKeys =
    //     List<Key>.generate(allDestinations.length, (int index) => GlobalKey())
    //         .toList();
    // _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration);
  }

  @override
  void dispose() {
    // for (AnimationController controller in _faders) controller.dispose();
    // _hide.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Hello World"),
      //   // backgroundColor: destination.color,
      // ),
      // backgroundColor: destination.color[50],
      body: SizedBox.expand(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/list");
          },
          child: Center(
            child: Text('Tap here to access'),
          ),
        ),
      ),
    );
  }
}
