import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:skybuildz/screens/drawer/deals.dart';
import 'package:skybuildz/screens/architecture/houseconstruction.dart';
import 'package:skybuildz/screens/architecture/commercialconstruction.dart';
import 'package:skybuildz/screens/architecture/wallconstruction.dart';
import 'package:skybuildz/screens/architecture/map&3d.dart';

class Architecture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4F51C0),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.call,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        launch('tel: +917985552408');
                      },
                      child: Text(
                        '+91 7985552408',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.local_offer),
                  color: Colors.white,
                  iconSize: 25,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Deals()),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 30.0),
            child: Row(
              children: <Widget>[
                Text('Construction & ',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 23.0)),
//                SizedBox(width: 10.0),
                Text('Architecture',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 23.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 182.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(75.0),
                topRight: Radius.circular(75.0),
              ),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 35.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height - 220.0,
                    child: ListView(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => House()),
                            );
                          },
                          child: _buildItem(
                            'assets/img/house.png',
                            'House Construction Package',
                            'Build your house with our experienced engineers',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Commercial()),
                            );
                          },
                          child: _buildItem(
                            'assets/img/commercial.jpg',
                            'Commercial Construction Package',
                            'Construct your space with minimal cost',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Wall()),
                            );
                          },
                          child: _buildItem(
                            'assets/img/wall.jpg',
                            'Compound Wall Package',
                            'Build your wall from our exclusive designs',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Map()),
                            );
                          },
                          child: _buildItem(
                            'assets/img/map.jpg',
                            'House Map & 3D Design',
                            'Plan your house with our experienced architects',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem(String imgPath, String name, String subtitle) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10, bottom: 20),
      child: InkWell(
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(17),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 15),
                blurRadius: 27,
                color: Colors.black12, // Black color with 12% opacity
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 5),
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              '$subtitle',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22),
                    child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 85.0,
                        width: 120.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
