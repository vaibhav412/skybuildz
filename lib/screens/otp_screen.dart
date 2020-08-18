import 'package:firebase_auth/firebase_auth.dart';
import 'package:skybuildz/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:skybuildz/screens/homeScreen.dart';

import '../components/otp_input.dart';

class OTPScreen extends StatefulWidget {
  final String mobileNumber;
  OTPScreen({
    Key key,
    @required this.mobileNumber,
  })  : assert(mobileNumber != null),
        super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;

  /// Control the input text field.
  TextEditingController _pinEditingController = TextEditingController();

  /// Decorate the outside of the Pin.
  PinDecoration _pinDecoration = UnderlineDecoration(
    enteredColor: Colors.black,
  );

  bool isCodeSent = false;
  bool showSpinner = false;
  bool isUserAlreadyRegister = false;
  String _verificationId;

  @override
  void initState() {
    super.initState();
    _onVerifyCode();
  }

  Future isUserAlreadyRegistered() async {
    await for (var snapshot in _firestore.collection('users').snapshots()) {
      for (var user in snapshot.documents) {
        final String phone = user.data['phonenumber'];
        print(phone);
        if (phone.substring(3) == widget.mobileNumber) {
          print('user already registered');
          isUserAlreadyRegister = true;
          return null;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print("isValid - $isCodeSent");
    print("mobile ${widget.mobileNumber}");
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
          title: Text(
            "Verify phone",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          textTheme: Theme.of(context).textTheme,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Text(
                  "Code is sent to " + widget.mobileNumber,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.black45,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: PinInputTextField(
                  pinLength: 6,
                  decoration: _pinDecoration,
                  controller: _pinEditingController,
                  autoFocus: true,
                  textInputAction: TextInputAction.done,
                  onSubmit: (pin) {
                    if (pin.length == 6) {
                      _onFormSubmitted();
                    } else {
                      showToast("Invalid OTP", Colors.red);
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: RaisedButton(
                      color: Color(0xFF4F51C0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Text(
                        "VERIFY",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        if (_pinEditingController.text.length == 6) {
                          setState(() {
                            showSpinner = true;
                          });
                          await isUserAlreadyRegistered();
                          _onFormSubmitted();
                        } else {
                          showToast("Invalid OTP", Colors.red);
                        }
                      },
                      padding: EdgeInsets.all(16.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showToast(message, Color color) {
    print(message);
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        backgroundColor: color,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  void _onVerifyCode() async {
    setState(() {
      isCodeSent = true;
    });
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _firebaseAuth
          .signInWithCredential(phoneAuthCredential)
          .then((AuthResult value) async {
        if (value.user != null) {
          // Handle logged in state
          print(value.user.phoneNumber);
          setState(() {
            showSpinner = true;
          });
          await isUserAlreadyRegistered();
          setState(() {
            showSpinner = false;
          });
          isUserAlreadyRegister
              ? Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(
                      user: value.user,
                    ),
                  ),
                  (Route<dynamic> route) => false)
              : Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(
                      user: value.user,
                    ),
                  ),
                  (Route<dynamic> route) => false);
        } else {
          showToast("Error validating OTP, try again", Colors.red);
        }
      }).catchError((error) {
        showToast("Try again in sometime", Colors.red);
      });
    };
    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      showToast(authException.message, Colors.red);
      setState(() {
        isCodeSent = false;
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };
    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
      setState(() {
        _verificationId = verificationId;
      });
    };

    // TODO: Change country code

    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+91${widget.mobileNumber}",
        timeout: const Duration(seconds: 60),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  void _onFormSubmitted() async {
    AuthCredential _authCredential = PhoneAuthProvider.getCredential(
        verificationId: _verificationId, smsCode: _pinEditingController.text);

    _firebaseAuth
        .signInWithCredential(_authCredential)
        .then((AuthResult value) {
      if (value.user != null) {
        // Handle loogged in state
        print(value.user.phoneNumber);
        setState(() {
          showSpinner = false;
        });
        isUserAlreadyRegister
            ? Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(
                    user: value.user,
                  ),
                ),
                (Route<dynamic> route) => false)
            : Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => Register(
                    user: value.user,
                  ),
                ),
                (Route<dynamic> route) => false);
      } else {
        showToast("Error validating OTP, try again", Colors.red);
      }
    }).catchError((error) {
      showToast("Something went wrong", Colors.red);
    });
  }
}
