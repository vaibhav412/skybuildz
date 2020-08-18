import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.1,
        backgroundColor: Color(0xFF4F51C0),
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Center(
                child: Image.asset(
                  'assets/img/5.png',
                  height: 130,
                  width: 230,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'SkyBuildz is a trusted name in the construction industry, SkyBuildz boast a unparalled quality of raw material and out of the box creative designs. We specialized in both domestic and commercial construction project and offer customized renovation services as well. Our mission is to deliver  on your promises. For over a year,through collaboration and expertise, we guide our clients throughout the construction process to turn their vision into reality. We operate as a family with a commitment to construct building and supply raw material that are measured on quality and values. Our way of connecting with our clients continues to be one-on-one, person-to-person.',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 50.0,
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Text(
                    'For any Concern/Questions kindly email us at skybuildzconstructions@gmail.com',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
