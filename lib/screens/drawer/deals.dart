import 'package:flutter/material.dart';

class Deals extends StatefulWidget {
  @override
  _DealsState createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.1,
          backgroundColor: Color(0xFF4F51C0),
          title: Text('Deals & Offers'),
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
            child: Scaffold(
          backgroundColor: Colors.white,
          body: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/img/offers.png'),
                SizedBox(
                  height: 0.0,
                ),
                Text(
                  'No Offers Available!!',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 25.0,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        )));
  }
}
