import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF4F51C0),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.1,
        backgroundColor: Color(0xFF4F51C0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 28, top: 0),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Let\'s Connect',
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 32),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      launch('tel: +917985552408');
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/img/phone.jpg", height: 30),
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Text(
                            '+91 7985552408',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      launch('https://wa.me/+919026727863');
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/img/whatsapp.png", height: 30),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              '+91 9026727863',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    child: Row(
                      children: [
                        Image.asset("assets/img/web.png", height: 30),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              'www.skybuildz.com',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      launch('mailto:skybuildzconstructions@gmail.com');
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/img/gmail.png", height: 20),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              'skybuildzconstructions@gmail.com',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Image.asset("assets/img/address.png", height: 30),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Avas Vikas, Jhansi',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      launch('https://www.instagram.com/skybuildz/');
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/img/instagram.png", height: 30),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              '@skybuildz',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      launch(
                          'https://www.facebook.com/SkyBuildz-Constructions-106748921143044/');
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/img/fb.png", height: 30),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              'SkyBuildz Constructions',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      launch('https://www.linkedin.com/company/skybuildz/');
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/img/linkedin.jpg", height: 30),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              'SkyBuildz',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  GestureDetector(
                    onTap: () {
                      launch('https://twitter.com/skybuildz');
                    },
                    child: Row(
                      children: [
                        Image.asset("assets/img/twitter.png", height: 30),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Container(
                            child: Text(
                              '@SkyBuildz',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Montserrat',
                              ),
                            ),
                          ),
                        ),
                      ],
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
