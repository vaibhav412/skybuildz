import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  @override
  _NotifyState createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.1,
          backgroundColor: Color(0xFF4F51C0),
          title: Text('Notifications'),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                icon: Icon(Icons.search),
                color: Colors.white,
                iconSize: 29,
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: SafeArea(
            child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('assets/img/notifications.png'),
              ),
              SizedBox(
                height: 40.0,
              ),
              Text(
                'No Notifications Yet!!',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25.0,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )));
  }
}
