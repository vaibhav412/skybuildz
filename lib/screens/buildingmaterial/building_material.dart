import 'package:flutter/material.dart';
import 'package:skybuildz/screens/drawer/deals.dart';
import 'package:skybuildz/screens/buildingmaterial/baalu.dart';
import 'package:skybuildz/screens/buildingmaterial/gitti.dart';
import 'package:skybuildz/screens/buildingmaterial/cement.dart';
import 'package:skybuildz/screens/buildingmaterial/brick.dart';
import 'package:skybuildz/screens/buildingmaterial/dust.dart';
import 'package:skybuildz/screens/buildingmaterial/mauram.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildingMaterial extends StatelessWidget {
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
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Building',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('Material',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
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
                    height: MediaQuery.of(context).size.height - 230.0,
                    child: ListView(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BaaluDetails()),
                            );
                          },
                          child: _buildItem(
                            'assets/img/sand.jpg',
                            'River Sand (Baalu)',
                            'Arach and Ramnagar Available',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GittiDetails()),
                            );
                          },
                          child: _buildItem(
                            'assets/img/gitti.jpg',
                            'Gitti (Stone)',
                            'Pauna and Aadha Pauna Available',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CementDetails()),
                            );
                          },
                          child: _buildItem('assets/img/cement.jpg', 'Cement',
                              'ACC, Prism, UltraTech and Mycem Available'),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BrickDetails()),
                            );
                          },
                          child: _buildItem(
                            'assets/img/brick1.jpg',
                            'Brick (Eenta)',
                            'No. 1, No. 2 & No. 3 Brick Available',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DustDetails()),
                            );
                          },
                          child: _buildItem(
                            'assets/img/dust.jpg',
                            'Dust',
                            'Blue & grey stone dust available',
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MauramDetails()),
                            );
                          },
                          child: _buildItem(
                            'assets/img/mauram.jpg',
                            'Mauram',
                            'Mauram of fine quality and different grades are available',
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

  Widget _buildItem(String imgPath, String name, String title) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10, bottom: 20),
      child: InkWell(
        child: Container(
          height: 130,
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
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              name,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              title,
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
                  margin: EdgeInsets.only(left: 5),
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
