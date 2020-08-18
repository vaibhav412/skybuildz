import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Carpentry extends StatefulWidget {
  @override
  _CarpentryState createState() => _CarpentryState();
}

class _CarpentryState extends State<Carpentry> {
  final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;
  final _auth = FirebaseAuth.instance;

  String _name;
  String _address;
  String _area;
  String _design;
  String _place;
  String _additional;
  bool _autovalidate = false;

  bool showSpinner = false;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.1,
          backgroundColor: Color(0xFF4F51C0),
          title: Text('Carpentry / Woodwork'),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              autovalidate: _autovalidate,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Name',
                      contentPadding: EdgeInsets.only(top: 25, bottom: 25),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 15),
                        child: Icon(
                          Icons.person_outline,
                          size: 20,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            BorderSide(width: 2, style: BorderStyle.none),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(width: 2, color: Colors.blue),
                      ),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Name is Required';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      _name = value;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Address',
                      contentPadding: EdgeInsets.only(top: 25, bottom: 25),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 15),
                        child: Icon(
                          Icons.room,
                          size: 20,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            BorderSide(width: 2, style: BorderStyle.none),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(width: 2, color: Colors.blue),
                      ),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Address is Required';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      _address = value;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Area (in sq. ft.)',
                      contentPadding: EdgeInsets.only(top: 25, bottom: 25),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 15),
                        child: Icon(
                          Icons.location_city,
                          size: 20,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            BorderSide(width: 2, style: BorderStyle.none),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(width: 2, color: Colors.blue),
                      ),
                    ),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Area is Required';
                      }
                      return null;
                    },
                    onSaved: (String value) {
                      _area = value;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    hint: Text('Do you need design?'),
                    value: _design,
                    items: [
                      DropdownMenuItem(
                        child: Text("Yes"),
                        value: 'Yes',
                      ),
                      DropdownMenuItem(
                        child: Text("No"),
                        value: 'No',
                      ),
                    ],
                    validator: (value) =>
                        value == null ? 'This field is required' : null,
                    onChanged: (value) {
                      setState(() {
                        _design = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    hint: Text('Place of woodwork'),
                    value: _place,
                    items: [
                      DropdownMenuItem(
                        child: Text("Bedrooms"),
                        value: 'Bedrooms',
                      ),
                      DropdownMenuItem(
                        child: Text("Hall"),
                        value: 'Hall',
                      ),
                      DropdownMenuItem(
                        child: Text("Kitchen"),
                        value: 'Kitchen',
                      ),
                      DropdownMenuItem(
                        child: Text("Mix Of BHK"),
                        value: 'BHK',
                      ),
                      DropdownMenuItem(
                        child: Text("Complete House"),
                        value: 'Complete House',
                      ),
                    ],
                    validator: (value) =>
                        value == null ? 'This field is required' : null,
                    onChanged: (value) {
                      setState(() {
                        _place = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Additional Information (Optional)',
                      contentPadding:
                          EdgeInsets.only(top: 25, bottom: 25, left: 20),
                      filled: true,
                      fillColor: Colors.white.withOpacity(0.8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            BorderSide(width: 2, style: BorderStyle.none),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(width: 2, color: Colors.blue),
                      ),
                    ),
                    onSaved: (String value) {
                      _additional = value;
                    },
                  ),
                  SizedBox(
                    height: 30,
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
                      try {
                        setState(() {
                          showSpinner = true;
                        });
                        _firestore.collection('carpentry').add({
                          'name': _name,
                          'phone': loggedInUser.phoneNumber,
                          'address': _address,
                          'area': _area,
                          'design': _design,
                          'place': _place,
                          'additional': _additional,
                        });
                        setState(() {
                          showSpinner = false;
                        });
                        showDialogBox(context);
                      } catch (e) {
                        print(e);
                      }
                    },
                    color: Color(0xFF4F51C0),
                    padding: EdgeInsets.fromLTRB(60, 25, 60, 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      'Submit',
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
        ),
      ),
    );
  }
}

void showDialogBox(BuildContext context) {
  var popup = AlertDialog(
    content: SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(
                'Your Information has been sent successfully. We will contact you shortly.'),
          ),
          SizedBox(
            height: 20,
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
