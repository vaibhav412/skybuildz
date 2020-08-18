import 'package:flutter/material.dart';
import 'package:skybuildz/screens/otp_screen.dart';

class ContinueWithPhone extends StatefulWidget {
  @override
  _ContinueWithPhoneState createState() => _ContinueWithPhoneState();
}

class _ContinueWithPhoneState extends State<ContinueWithPhone> {
  final TextEditingController _phoneNumberController = TextEditingController();

  bool isValid = false;

  Future<Null> validate(StateSetter updateState) async {
    print("in validate : ${_phoneNumberController.text.length}");
    if (_phoneNumberController.text.length == 10) {
      updateState(() {
        isValid = true;
      });
    }
  }

  String phoneNumber = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Continue with phone",
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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.7, 0.9],
                    colors: [
                      Color(0xFFFFFFFF),
                      Color(0xFFF7F7F7),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 130,
                      child: Image.asset('assets/img/holding-phone.png'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 64),
                      child: Text(
                        "You'll receive a 6 digit code to verify next.",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xFF818181),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.13,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {
                    print("pressed");
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext bc) {
                        print("VALID CC: $isValid");

                        return StatefulBuilder(
                            builder: (BuildContext context, StateSetter state) {
                          return Container(
                            padding: EdgeInsets.all(16),
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(bottom: 0),
                                  child: TextFormField(
                                    maxLength: 10,
                                    keyboardType: TextInputType.number,
                                    controller: _phoneNumberController,
                                    autofocus: true,
                                    onChanged: (text) {
                                      validate(state);
                                    },
                                    decoration: InputDecoration(
                                      labelText: "10 digit mobile number",
                                      prefix: Container(
                                        padding: EdgeInsets.all(4.0),
                                        child: Text(
                                          "+91",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                    autovalidate: true,
                                    autocorrect: false,
                                    maxLengthEnforced: true,
                                    validator: (value) {
                                      return !isValid
                                          ? 'Please provide a valid 10 digit phone number'
                                          : null;
                                    },
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(16),
                                  child: Center(
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.85,
                                      child: RaisedButton(
                                        color: !isValid
                                            ? Color(0xFF4F51C0).withOpacity(0.5)
                                            : Color(0xFF4F51C0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child: Text(
                                          !isValid
                                              ? "ENTER PHONE NUMBER"
                                              : "CONTINUE",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          if (isValid) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      OTPScreen(
                                                    mobileNumber:
                                                        _phoneNumberController
                                                            .text,
                                                  ),
                                                ));
                                          } else {
                                            validate(state);
                                          }
                                        },
                                        padding: EdgeInsets.all(16.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF4F51C0),
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Enter Your Phone Number",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
