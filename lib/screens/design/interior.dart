import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Interior extends StatefulWidget {
  @override
  _InteriorState createState() => _InteriorState();
}

class _InteriorState extends State<Interior> {
  final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;
  final _auth = FirebaseAuth.instance;

  String _name;
  String _address;
  String _area;
  String _type;
  String _floors;
  String _bhk;
  String _paint;
  String _flooring;
  String _modular;
  String _false;
  String _carpentry;
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
          title: Text('Interior Design'),
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
                    hint: Text('What do you want?'),
                    value: _type,
                    items: [
                      DropdownMenuItem(
                        child: Text("New House Design"),
                        value: 'New',
                      ),
                      DropdownMenuItem(
                        child: Text("Old House Renovate"),
                        value: 'Renovate',
                      ),
                    ],
                    validator: (value) =>
                        value == null ? 'This field is required' : null,
                    onChanged: (value) {
                      setState(() {
                        _type = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    hint: Text('No. of Floors'),
                    value: _floors,
                    items: [
                      DropdownMenuItem(
                        child: Text("Only Ground Floor"),
                        value: '1',
                      ),
                      DropdownMenuItem(
                        child: Text("Ground Floor + 1"),
                        value: '2',
                      ),
                      DropdownMenuItem(
                        child: Text("Ground Floor + 2"),
                        value: '3',
                      ),
                      DropdownMenuItem(
                        child: Text("More"),
                        value: 'More',
                      ),
                    ],
                    validator: (value) =>
                        value == null ? 'This field is required' : null,
                    onChanged: (value) {
                      setState(() {
                        _floors = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    hint: Text('No. of BHK'),
                    value: _bhk,
                    items: [
                      DropdownMenuItem(
                        child: Text("1 BHK"),
                        value: '1',
                      ),
                      DropdownMenuItem(
                        child: Text("2 BHK"),
                        value: '2',
                      ),
                      DropdownMenuItem(
                        child: Text("3 BHK"),
                        value: '3',
                      ),
                      DropdownMenuItem(
                        child: Text("4 BHK"),
                        value: '4',
                      ),
                      DropdownMenuItem(
                        child: Text("More"),
                        value: 'More',
                      ),
                    ],
                    validator: (value) =>
                        value == null ? 'This field is required' : null,
                    onChanged: (value) {
                      setState(() {
                        _bhk = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    hint: Text('Flooring Type'),
                    value: _flooring,
                    items: [
                      DropdownMenuItem(
                        child: Text("Tiles"),
                        value: 'Tiles',
                      ),
                      DropdownMenuItem(
                        child: Text("Marble"),
                        value: 'Marble',
                      ),
                      DropdownMenuItem(
                        child: Text("Granite"),
                        value: 'Granite',
                      ),
                      DropdownMenuItem(
                        child: Text("None"),
                        value: 'None',
                      ),
                    ],
                    validator: (value) =>
                        value == null ? 'This field is required' : null,
                    onChanged: (value) {
                      setState(() {
                        _flooring = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    hint: Text('Paint Type'),
                    value: _paint,
                    items: [
                      DropdownMenuItem(
                        child: Text("Budget"),
                        value: 'Budget',
                      ),
                      DropdownMenuItem(
                        child: Text("Basic"),
                        value: 'Basic',
                      ),
                      DropdownMenuItem(
                        child: Text("Premium"),
                        value: 'Premium',
                      ),
                      DropdownMenuItem(
                        child: Text("None"),
                        value: 'None',
                      ),
                    ],
                    validator: (value) =>
                        value == null ? 'This field is required' : null,
                    onChanged: (value) {
                      setState(() {
                        _paint = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    hint: Text('Modular Kitchen Type'),
                    value: _modular,
                    items: [
                      DropdownMenuItem(
                        child: Text("Basic"),
                        value: 'Basic',
                      ),
                      DropdownMenuItem(
                        child: Text("Premium"),
                        value: 'Premium',
                      ),
                      DropdownMenuItem(
                        child: Text("None"),
                        value: 'None',
                      ),
                    ],
                    validator: (value) =>
                        value == null ? 'This field is required' : null,
                    onChanged: (value) {
                      setState(() {
                        _modular = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    hint: Text('False Ceiling Type'),
                    value: _false,
                    items: [
                      DropdownMenuItem(
                        child: Text("Basic"),
                        value: 'Basic',
                      ),
                      DropdownMenuItem(
                        child: Text("Premium"),
                        value: 'Premium',
                      ),
                      DropdownMenuItem(
                        child: Text("None"),
                        value: "None",
                      ),
                    ],
                    validator: (value) =>
                        value == null ? 'This field is required' : null,
                    onChanged: (value) {
                      setState(() {
                        _false = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  DropdownButtonFormField(
                    hint: Text('Do you want carpentry/woodwork?'),
                    value: _carpentry,
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
                        _carpentry = value;
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
                        _firestore.collection('interior').add({
                          'name': _name,
                          'phone': loggedInUser.phoneNumber,
                          'address': _address,
                          'area': _area,
                          'type': _type,
                          'floors': _floors,
                          'bhk': _bhk,
                          'paint': _paint,
                          'flooring': _flooring,
                          'modular': _modular,
                          'false': _false,
                          'carpentry': _carpentry,
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
