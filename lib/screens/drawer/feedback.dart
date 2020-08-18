import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Feed extends StatefulWidget {
  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final _firestore = Firestore.instance;
  final nameTextController = TextEditingController();
  final phoneTextController = TextEditingController();
  final feedbackTextController = TextEditingController();

  String _name;
  String _phone;
  String _feedback;

  bool showSpinner = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.1,
          backgroundColor: Color(0xFF4F51C0),
          title: Text('Feedback'),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 50, left: 24, right: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _buildName(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildPhoneNumber(),
                  SizedBox(
                    height: 30,
                  ),
                  _buildFeedback(),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: RaisedButton(
                      focusElevation: 0,
                      highlightElevation: 0,
                      splashColor: Colors.white.withOpacity(0.1),
                      padding: EdgeInsets.symmetric(vertical: 20),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        }
                        _formKey.currentState.save();
                        setState(() {
                          showSpinner = true;
                        });
                        _firestore.collection('feedback').add({
                          'name': _name,
                          'phone': _phone,
                          'feedback': _feedback,
                        });
                        setState(() {
                          showSpinner = false;
                        });

                        nameTextController.clear();
                        phoneTextController.clear();
                        feedbackTextController.clear();
                        showDialogBox(context);
                      },
                      color: Color(0xFF4F51C0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'Send',
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
          ),
        ),
      ),
    );
  }

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Name',
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
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
      controller: nameTextController,
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Phone number',
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Phone number is required';
        }
        return null;
      },
      onSaved: (String value) {
        _phone = value;
      },
      controller: phoneTextController,
    );
  }

  Widget _buildFeedback() {
    return TextFormField(
      maxLines: 8,
      decoration: InputDecoration(
        filled: true,
        labelText: 'Write your feedback',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Feedback is required';
        }
        return null;
      },
      onSaved: (String value) {
        _feedback = value;
      },
      controller: feedbackTextController,
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
            child: Text('Your Feedback has been Submitted Successfully!'),
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
