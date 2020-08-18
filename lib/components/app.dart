import 'package:firebase_auth/firebase_auth.dart';
import 'package:skybuildz/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:skybuildz/screens/phone_screen.dart';

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  FirebaseUser user;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    FirebaseUser _user = await _firebaseAuth.currentUser();
    setState(() {
      user = _user;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(user);
    return Scaffold(
        body: user != null
            ? HomeScreen(
                user: user,
              )
            : ContinueWithPhone());
  }
}
