import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:productdotio/utilities/page_route_constants.dart' as UtilRoutes;
import 'package:productdotio/utilities/user_type.dart';
import 'package:productdotio/utilities/theme.dart' as UtilTheme;

class OTPScreen extends StatefulWidget {
  OTPScreen({Key? key, @required this.userType}) : super(key: key);
  UserType? userType;
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
//
  final _formKey = new GlobalKey<FormState>();

  final TextEditingController _pinPutController1 = TextEditingController();
  final FocusNode _pinPutFocusNode1 = FocusNode();
  String _userEnteredPin = "";

  bool _showResendOTP = false;

  Timer? _timer;
  int _timeRemaining = 5;
  final oneSec = const Duration(seconds: 1);

  Duration _animationDuration = Duration(seconds: 1);

  @override
  void initState() {
    print("userType ::: ${widget.userType == UserType.Customer}");
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    _timeRemaining = 5;
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timeRemaining == 0) {
          if (mounted)
            setState(() {
              timer.cancel();
              _showResend();
            });
        } else {
          if (mounted)
            setState(() {
              _timeRemaining--;
            });
        }
      },
    );
  }

  _showResend() {
    if (mounted)
      setState(() {
        _showResendOTP = true;
        print("Time Up - _showResendOTP - $_showResendOTP");
      });
  }

  _hideResend() {
    if (mounted)
      setState(() {
        _showResendOTP = false;
        print("Time Start - _showResendOTP - $_showResendOTP");
      });
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(width: 2),
      color: UtilTheme.productColor,
    );
  }

  _showSnakBar({@required String? message}) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message ??= "Error Occured"),
      duration: Duration(seconds: 5),
    ));
  }

  _showVerificationPopup() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext cx) {
        return OTPVerificationAlert(
          openHomeScreen: () {
            // // //
            // String? homeScreenWidget;
            // //
            // if (widget.userType == UserType.Customer) {
            //   homeScreenWidget = UtilRoutes.customerHomeScreenRoute;
            // } else if (widget.userType == UserType.StoreOwner) {
            //   homeScreenWidget = UtilRoutes.storeOwnerCategoryScreenRoute;
            // }
            // // Navigator.pop(cx); // Current Alert
            // // Navigator.pop(context); // Current OTP Screen
            // // Navigator.popAndPushNamed(context,
            // //     homeScreenWidget!); // Pops Main Login Screen And Pushes Homescreen

            // Navigator.of(context)
            //     .popUntil(ModalRoute.withName(UtilRoutes.loginRoute));
            // Navigator.popAndPushNamed(context,
            //     homeScreenWidget!); // Pops Main Login Screen And Pushes Homescreen

            if (widget.userType == UserType.Customer) {
              print("${UtilRoutes.customerHomeScreenRoute}");
              Navigator.pushNamed(context, UtilRoutes.customerHomeScreenRoute);
              return;
            } else if (widget.userType == UserType.StoreOwner) {
              print("${UtilRoutes.storeOwnerCategoryScreenRoute}");
              Navigator.pushNamed(
                  context, UtilRoutes.storeOwnerCategoryScreenRoute);
              return;
            }

            Navigator.popAndPushNamed(
                context, UtilRoutes.customerHomeScreenRoute);
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        hoverColor: UtilTheme.productColor,
        elevation: 5,
        onPressed: () {
          print("Final Entered OTP - $_userEnteredPin");
          if (_formKey.currentState!.validate()) {
            _showVerificationPopup();
          }
        },
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(35))),
        icon: Icon(Icons.sms),
        label: Text("Verify OTP"),
      ),

      // Container(
      //   width: 140,
      //   // margin: const EdgeInsets.all(20),
      //   height: 45,
      //   decoration: BoxDecoration(
      //     color: UtilTheme.productColor,
      //     borderRadius: BorderRadius.circular(10),
      //   ),
      //   child: GestureDetector(
      //     onTap: () {
      //       if (_formKey.currentState!.validate()) {
      //         // rouing and animation in button
      //       }
      //     },
      //     child: Row(
      //       mainAxisSize: MainAxisSize.min,
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Icon(
      //           Icons.sms,
      //           size: 18,
      //           color: Colors.white,
      //         ),
      //         SizedBox(width: 10),
      //         Text(
      //           "Verify OTP",
      //           style: UtilTheme.textstyle_18_Bold_DarkBlue,
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
      body: Container(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15),
                  Text(
                    "Verify Your Phone Number",
                    textAlign: TextAlign.left,
                    style: UtilTheme.textstyle_25_Bold_DarkBlue,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Enter the 6-Digit OTP sent to your phone number for verification",
                    textAlign: TextAlign.start,
                    style: UtilTheme.textstyle_17,
                  ),
                  SizedBox(height: 30),
                  Container(
                    // padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                    child: Form(
                      key: _formKey,
                      child: PinPut(
                        fieldsCount: 6,
                        focusNode: _pinPutFocusNode1,
                        controller: _pinPutController1,
                        submittedFieldDecoration: _pinPutDecoration.copyWith(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        selectedFieldDecoration: _pinPutDecoration,
                        followingFieldDecoration: _pinPutDecoration.copyWith(
                          color: UtilTheme.productColor,
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: UtilTheme.productColor,
                          ),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return 'Please enter the OTP';
                          } else if (value.length < 6) {
                            return 'Please enter 6 digits OTP';
                          }
                          return null;
                        },
                        onSubmit: (String pin) {
                          _userEnteredPin = pin;
                          FocusScope.of(context).unfocus();
                          print(pin);
                        },
                        onChanged: (String pin) {
                          _userEnteredPin = pin;
                          print(pin);
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  AnimatedContainer(
                    duration: _animationDuration,
                    height: _showResendOTP ? 50 : 0,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Didn't receive the code? ",
                            style: UtilTheme.textstyle_16_Black,
                          ),
                          TextSpan(
                            text: "Resent",
                            style: UtilTheme.textstyle_16_Blue,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _startTimer();
                                _hideResend();
                                print("resend otp - Start Timer");
                              },
                          )
                        ],
                      ),
                    ),
                  ),
                  //
                  SizedBox(height: 20),
                  //
                  AnimatedContainer(
                    duration: _animationDuration,
                    height: _showResendOTP ? 0 : 50,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Recovery code has been sent to your phone number. Code is valid only for ",
                            style: UtilTheme.textstyle_16_Black,
                          ),
                          TextSpan(
                            text: "$_timeRemaining Seconds.",
                            style: UtilTheme.textstyle_16_Blue,
                          )
                        ],
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

class OTPVerificationAlert extends StatefulWidget {
  Function()? openHomeScreen;
  OTPVerificationAlert({
    Key? key,
    @required this.openHomeScreen,
  }) : super(key: key);

  @override
  _OTPVerificationAlertState createState() => _OTPVerificationAlertState();
}

class _OTPVerificationAlertState extends State<OTPVerificationAlert> {
  String _status = "Verifying";
  bool _verificationCompleted = false;
  Timer? _timer;
  int _timeRemaining = 1;
  final oneSec = const Duration(seconds: 1);

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() {
    _timeRemaining = 2;
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_timeRemaining == 0) {
          _showOTPVerificationCompleted();
          return;
        } else {
          _timeRemaining--;
        }
      },
    );
  }

  _showOTPVerificationCompleted() {
    if (mounted)
      setState(() {
        _status = "Verification Completed";
        _verificationCompleted = true;
        Future.delayed(Duration(seconds: 1), () {
          _timer!.cancel();
          Navigator.pop(context);
          widget.openHomeScreen!();
        });
      });
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 90,
        child: Column(
          children: [
            Container(margin: EdgeInsets.all(15), child: Text("$_status")),
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              child: _verificationCompleted
                  ? Icon(Icons.check, color: UtilTheme.productColor)
                  : LinearProgressIndicator(),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    );
  }
}
