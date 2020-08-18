import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skybuildz/screens/drawer/deals.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CementDetails extends StatefulWidget {
  @override
  _CementDetailsState createState() => _CementDetailsState();
}

class _CementDetailsState extends State<CementDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xFF4F51C0),
                padding: EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10),
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
                    Text(
                      'Building Material',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
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
              Stack(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    child: FittedBox(
                      child: Image.asset('assets/img/cement.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 200),
                    height: MediaQuery.of(context).size.height - 297.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0),
                      ),
                    ),
                    child: ListView(
                      primary: false,
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 30.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height - 410.0,
                            child: ListView(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Cement',
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/img/5star.jpg',
                                      height: 30,
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Being one of the renowned organizations in the industry, we are highly engaged in providing a premium quality range of Construction Cement.',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.0,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Product Details :',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Usage/Application: Used in constructions of hydraulic structures, marine work, mass construction such as homes, dams, buildings, etc.',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Brands Available : ACC, Prism, UltraTech, etc.',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Packing Size : 50 Kg',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Features : High ultimate strength, Resist wet cracking, High degree of cohesion',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Cement Grade : General High Grade',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Form : Powder',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.0,
                                      child: Divider(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Salient Features :',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'End-To-End service',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Flexible Payment Options',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Quality Assurance with Reasonable Pricing',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Timely Update & On-Time Delivery',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'No delivery charges',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                launch('tel: +917985552408');
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5),
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Color(0xFF4F51C0),
                                  borderRadius: BorderRadius.circular(22),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color(0xFF4F51C0),
                                        Color(0xFF4F51C0).withOpacity(0.9)
                                      ]),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Call Now',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                getCurrentUser();
                                showDialogBox(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(22),
                                  gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Colors.red,
                                        Colors.red.withOpacity(0.8)
                                      ]),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.message,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Send Enquiry',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final _firestore = Firestore.instance;
FirebaseUser loggedInUser;
final _auth = FirebaseAuth.instance;

void getCurrentUser() async {
  try {
    final user = await _auth.currentUser();
    if (user != null) {
      loggedInUser = user;
    }
  } catch (e) {
    print(e);
  }
}

void showDialogBox(BuildContext context) {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _quality;
  String _quantity;
  bool _autovalidate = false;

  var popup = AlertDialog(
    content: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        key: _formKey,
        autovalidate: _autovalidate,
        child: Column(
          children: [
            DropdownButtonFormField(
              hint: Text('Brand'),
              value: _quality,
              items: [
                DropdownMenuItem(
                  child: Text("ACC"),
                  value: 'ACC',
                ),
                DropdownMenuItem(
                  child: Text("Prism"),
                  value: 'Prism',
                ),
                DropdownMenuItem(
                  child: Text("UltraTech"),
                  value: 'UltraTech',
                ),
                DropdownMenuItem(
                  child: Text("Mycem"),
                  value: 'Mycem',
                ),
                DropdownMenuItem(
                  child: Text("Reliance"),
                  value: 'Reliance',
                ),
              ],
              validator: (value) =>
                  value == null ? 'This field is required' : null,
              onChanged: (value) {
                _quality = value;
              },
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Quantity',
                contentPadding: EdgeInsets.only(top: 25, bottom: 25, left: 20),
                filled: true,
                fillColor: Colors.white.withOpacity(0.8),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 2, style: BorderStyle.none),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 2, color: Colors.blue),
                ),
              ),
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Quantity is Required';
                }
                return null;
              },
              onSaved: (String value) {
                _quantity = value;
              },
            ),
            SizedBox(
              height: 30,
            ),
            RaisedButton(
              focusElevation: 0,
              highlightElevation: 0,
              splashColor: Colors.white.withOpacity(0.1),
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              onPressed: () {
                getCurrentUser();
                if (!_formKey.currentState.validate()) {
                  return;
                }
                _formKey.currentState.save();
                _firestore.collection('enquiry').add({
                  'quantity': _quantity,
                  'quality': _quality,
                  'phone': loggedInUser.phoneNumber,
                  'buildingmaterial': 'Cement',
                });
                Navigator.pop(context);
                showDialogBox2(context);
              },
              color: Colors.redAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                'Send Enquiry',
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
    ),
  );
  // ignore: non_constant_identifier_names
  showDialog(context: context, builder: (BuildContext) => popup);
}

void showDialogBox2(BuildContext context) {
  var popup = AlertDialog(
    content: SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
                'Your Enquiry has been sent Successfully. We will contact you shortly.'),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            focusElevation: 0,
            highlightElevation: 0,
            splashColor: Colors.white.withOpacity(0.1),
            padding: EdgeInsets.symmetric(vertical: 20),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Color(0xFF4F51C0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              'Okay',
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
  );
  // ignore: non_constant_identifier_names
  showDialog(context: context, builder: (BuildContext) => popup);
}
