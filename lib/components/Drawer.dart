import 'package:flutter/material.dart';
import 'package:skybuildz/screens/drawer/estimate.dart';
import 'package:skybuildz/screens/drawer/notify.dart';
import 'package:skybuildz/screens/drawer/profile.dart';
import 'package:skybuildz/screens/drawer/aboutus.dart';
import 'package:skybuildz/screens/drawer/feedback.dart';
import 'package:skybuildz/screens/drawer/contactus.dart';
import 'package:skybuildz/screens/drawer/deals.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainDrawer extends StatefulWidget {
  final FirebaseUser user;

  MainDrawer({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Color(0xFF4F51C0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 30, bottom: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/img/image.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${widget.user.phoneNumber}',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: height - 221,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Icon(Icons.home),
                    title: Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      'Profile',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                            user: widget.user,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text(
                      'Notification',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Notify()),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Icon(Icons.done_all),
                    title: Text(
                      'Estimate',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Estimate(
                                  user: widget.user,
                                )),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Icon(Icons.local_offer),
                    title: Text(
                      'Deals & Offers',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Deals()),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Icon(Icons.info),
                    title: Text(
                      'About Us',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUs()),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Icon(Icons.contact_mail),
                    title: Text(
                      'Contact Us',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ContactUs()),
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: ListTile(
                    leading: Icon(Icons.feedback),
                    title: Text(
                      'Feedback',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Feed()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
