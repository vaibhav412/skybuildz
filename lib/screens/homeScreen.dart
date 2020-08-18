import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skybuildz/components/Drawer.dart';
import 'package:skybuildz/screens/buildingmaterial/building_material.dart';
import 'package:skybuildz/screens/architecture/architecture.dart';
import 'package:skybuildz/screens/design/design_and_renovation.dart';
import 'package:skybuildz/screens/drawer/notify.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseUser user;

  HomeScreen({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4F51C0),
      appBar: AppBar(
        title: Text(
          'SkyBuildz',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            fontFamily: 'Montserrat',
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xFF4F51C0),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            iconSize: 29,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Notify()),
              );
            },
          ),
        ],
      ),
      drawer: MainDrawer(
        user: user,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(20.0),
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 5.0, // 5 top and bottom
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  icon: SvgPicture.asset("assets/img/search.svg"),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'What are you looking for ?',
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                  // Our background
                  Container(
                    margin: EdgeInsets.only(top: 80),
                    decoration: BoxDecoration(
                      color: Color(0xFFF1EFF1),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                    ),
                  ),
                  ListView(
                    children: <Widget>[
                      Card(
                        title: 'Building Material',
                        photoName: '2',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BuildingMaterial()),
                          );
                        },
                      ),
                      Card(
                        title: 'Construction & Architecture',
                        photoName: '3',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Architecture()),
                          );
                        },
                      ),
                      Card(
                        title: 'Design & Renovation',
                        photoName: '4',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DesignAndRenovation()),
                          );
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Card extends StatelessWidget {
  const Card({this.title, this.photoName, this.onTap});

  final String title;
  final String photoName;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 22,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 15),
                blurRadius: 27,
                color: Colors.black12, // Black color with 12% opacity
              ),
            ],
          ),
          height: 120,
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 15, right: 14),
                child: Image.asset(
                  'assets/img/$photoName.png',
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Container(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Circular',
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
