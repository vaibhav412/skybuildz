import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skybuildz/screens/homeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:geolocator/geolocator.dart';

class Register extends StatefulWidget {
  Register({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  final FirebaseUser user;

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _firestore = Firestore.instance;

  String _firstname;
  String _lastname;
  String _city;
  bool showSpinner = false;

  Location location = Location();

  final Color textPrimaryColor = Color.fromRGBO(27, 27, 27, 1);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    await location.getCurrentLocation();
    print('latitude ${location.latitude} longitude ${location.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(246, 246, 246, 1),
        body: SingleChildScrollView(
          child: Container(
            width: width,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: height * 0.15,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Let\'s Get Started',
                      style: TextStyle(
                        color: textPrimaryColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.005,
                    ),
                    Text(
                      'Create an account to continue',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.09,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 40, left: 40),
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'First Name',
                                contentPadding:
                                    EdgeInsets.only(top: 25, bottom: 25),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 15),
                                  child: Icon(
                                    Icons.person_outline,
                                    size: 20,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.blue),
                                ),
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'First Name is Required';
                                }
                                return null;
                              },
                              onSaved: (String value) {
                                _firstname = value;
                              },
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Last Name',
                                contentPadding:
                                    EdgeInsets.only(top: 25, bottom: 25),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 15),
                                  child: Icon(
                                    Icons.person_outline,
                                    size: 20,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.blue),
                                ),
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'Last Name is Required';
                                }
                                return null;
                              },
                              onSaved: (String value) {
                                _lastname = value;
                              },
                            ),
                            SizedBox(
                              height: height * 0.05,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: 'City/Town',
                                contentPadding:
                                    EdgeInsets.only(top: 25, bottom: 25),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 15),
                                  child: Icon(
                                    Icons.location_city,
                                    size: 20,
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white.withOpacity(0.8),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                      width: 0, style: BorderStyle.none),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(width: 2, color: Colors.blue),
                                ),
                              ),
                              validator: (String value) {
                                if (value.isEmpty) {
                                  return 'City/Town name is Required';
                                }
                                return null;
                              },
                              onSaved: (String value) {
                                _city = value;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.09,
                      ),
                      RaisedButton(
                        focusElevation: 0,
                        highlightElevation: 0,
                        splashColor: Colors.white.withOpacity(0.1),
                        onPressed: () {
                          if (!_formKey.currentState.validate()) {
                            return;
                          }

                          _formKey.currentState.save();

                          setState(() {
                            showSpinner = true;
                          });

                          _firestore.collection('users').add({
                            'firstname': _firstname,
                            'lastname': _lastname,
                            'city': _city,
                            'phonenumber': widget.user.phoneNumber,
                            'latitude': location.latitude,
                            'longitude': location.longitude,
                          });
                          setState(() {
                            showSpinner = false;
                          });
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomeScreen(user: widget.user)),
                              (Route<dynamic> route) => false);
                        },
                        color: Color(0xFF4F51C0),
                        padding: EdgeInsets.fromLTRB(60, 25, 60, 25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.06,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Location {
  double latitude;
  double longitude;
  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
