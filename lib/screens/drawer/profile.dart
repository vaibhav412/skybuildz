import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  final FirebaseUser user;

  ProfileScreen({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _firestore = Firestore.instance;

  final nameTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final addressTextController = TextEditingController();

  String _name;
  String _email;
  String _address;
  bool isUserAlreadyCreatedProfile = false;
  bool showSpinner = false;
  String _docID;
  String _databasename;
  String _databaseemail;
  String _databaseaddress;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      showSpinner = true;
    });
    hasUserAlreadyCreatedProfile();
    setState(() {
      showSpinner = false;
    });
  }

  Future hasUserAlreadyCreatedProfile() async {
    await for (var snapshot in _firestore.collection('profile').snapshots()) {
      for (var profile in snapshot.documents) {
        final String phone = profile.data['phone'];
        if (phone == widget.user.phoneNumber) {
          print(profile.documentID);
          _docID = profile.documentID;
          print(profile.data['name']);
          print(profile.data['email']);
          print(profile.data['address']);
          _databasename = profile.data['name'];
          _databaseemail = profile.data['email'];
          _databaseaddress = profile.data['address'];
          print('user already created profile');

          setState(() {
            isUserAlreadyCreatedProfile = true;
          });
          return null;
        }
      }
    }
    print('user not registered');
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Color(0xFF4F51C0),
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.1,
          backgroundColor: Color(0xFF4F51C0),
          title: Text('Profile'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              color: Color(0xFF4F51C0),
              child: Column(
                children: [
                  Container(
                    width: 140,
                    height: 140,
                    margin: EdgeInsets.only(top: 15, bottom: 35),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/img/image.jpg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Stack(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height - 250.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFF1EFF1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: isUserAlreadyCreatedProfile
                                ? _databasename
                                : 'Name',
                            contentPadding:
                                EdgeInsets.only(top: 20, bottom: 20),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 15),
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
                                  BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.blue),
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
                          keyboardType: TextInputType.name,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TextField(
                          readOnly: true,
                          decoration: InputDecoration(
                            hintText: '${widget.user.phoneNumber}',
                            contentPadding:
                                EdgeInsets.only(top: 20, bottom: 20),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 15),
                              child: Icon(
                                Icons.phone,
                                color: Colors.black45,
                                size: 20,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: isUserAlreadyCreatedProfile
                                ? _databaseaddress
                                : 'Address',
                            contentPadding:
                                EdgeInsets.only(top: 20, bottom: 20),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 15),
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
                                  BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.blue),
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
                          keyboardType: TextInputType.streetAddress,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: isUserAlreadyCreatedProfile
                                ? _databaseemail
                                : 'Email Address',
                            contentPadding:
                                EdgeInsets.only(top: 20, bottom: 20, right: 20),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 15),
                              child: Icon(
                                Icons.mail,
                                size: 20,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(width: 0, style: BorderStyle.none),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide:
                                  BorderSide(width: 2, color: Colors.blue),
                            ),
                          ),
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Email is Required';
                            }
                            return null;
                          },
                          onSaved: (String value) {
                            _email = value;
                          },
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 100),
                        child: RaisedButton(
                          focusElevation: 0,
                          highlightElevation: 0,
                          splashColor: Colors.white.withOpacity(0.1),
                          padding: EdgeInsets.symmetric(vertical: 20),
                          onPressed: () async {
                            if (!_formKey.currentState.validate()) {
                              return;
                            }
                            _formKey.currentState.save();
                            try {
                              setState(() {
                                showSpinner = true;
                              });
                              isUserAlreadyCreatedProfile
                                  ? await _firestore
                                      .collection('profile')
                                      .document(_docID)
                                      .updateData({
                                      'name': _name,
                                      'address': _address,
                                      'email': _email,
                                    })
                                  : await _firestore.collection('profile').add({
                                      'name': _name,
                                      'phone': widget.user.phoneNumber,
                                      'address': _address,
                                      'email': _email,
                                    });

                              setState(() {
                                showSpinner = false;
                              });
                              nameTextController.clear();
                              addressTextController.clear();
                              emailTextController.clear();
                              showDialogBox(context);
                            } catch (e) {
                              print(e);
                            }
                          },
                          color: Color(0xFF4F51C0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ))
          ],
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
            child: Text('Your Profile has been saved Successfully!'),
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
              Navigator.pop(context);
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
