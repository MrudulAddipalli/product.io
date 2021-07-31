import 'package:flutter/material.dart';
import 'package:productdotio/screens/otpscreen.dart';
import 'package:productdotio/utilities/user_type.dart';

import 'package:productdotio/utilities/theme.dart' as UtilTheme;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _currentPage = 0;
  Duration _animationDuration = Duration(milliseconds: 300);
  PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1, keepPage: true);

  openPageWithIndex({int index = 0}) {
    _pageController.animateToPage(
      index,
      curve: Curves.decelerate,
      duration: _animationDuration,
    ); // for animated jump. Requires a curve and a duration
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: UtilTheme.productColor,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: DraggableScrollableSheet(
          maxChildSize: 1,
          minChildSize: 0.7,
          initialChildSize: 0.7,
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (_currentPage != 0) {
                                print("Animating");
                                openPageWithIndex(index: 0);
                              }
                              print("Current Index - $_currentPage");
                            },
                            child: Center(
                              child: Text(
                                "Customer",
                                style: UtilTheme.textstyle_16_Black,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (_currentPage != 1) {
                                print("Animating");
                                openPageWithIndex(index: 1);
                              }
                              print("Current Index - $_currentPage");
                            },
                            child: Center(
                              child: Text(
                                "Store Owner",
                                style: UtilTheme.textstyle_16_Black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      AnimatedContainer(
                        duration: _animationDuration,
                        width: MediaQuery.of(context).size.width / 2,
                        height: 5,
                        color: (_currentPage == 0)
                            ? UtilTheme.productColor
                            : UtilTheme.whiteColor,
                      ),
                      AnimatedContainer(
                        duration: _animationDuration,
                        height: 5,
                        width: MediaQuery.of(context).size.width / 2,
                        color: (_currentPage == 1)
                            ? UtilTheme.productColor
                            : UtilTheme.whiteColor,
                      ),
                    ],
                  ),
                  Expanded(
                    child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentPage = index;
                          });
                        },
                        itemCount: 2,
                        itemBuilder: (context, index) =>
                            PageViewScreen(currentPage: _currentPage)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({
    Key? key,
    required int currentPage,
  })  : _currentPage = currentPage,
        super(key: key);

  final int _currentPage;

  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  UserType? userType;
  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();

  String getSignInAsString() {
    if (widget._currentPage == 0) {
      userType = UserType.Customer;
      return "Customer";
    } else if (widget._currentPage == 1) {
      userType = UserType.StoreOwner;
      return "Store Owner";
    }
    return "Customer";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              '''Sign In or Register As ${getSignInAsString()}''',
              textAlign: TextAlign.center,
              style: UtilTheme.textstyle_25_Bold_DarkBlue,
            ),
            SizedBox(height: 15),
            Text(
              '''Enter Your Phone Number To Proceed Further''',
              textAlign: TextAlign.center,
              style: UtilTheme.textstyle_17,
            ),
            //
            SizedBox(height: 50),
            //
            Form(
              key: _formKey,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Flexible(
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: TextFormField(
                        style: UtilTheme.textstyle_17,
                        textAlign: TextAlign.center,
                        controller: _phoneNumberController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                        // maxLength: 10,
                        enabled: true,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "XXXXX XXXXX",
                          hintStyle: UtilTheme.textstyle_17,
                        ),
                        onChanged: (phone) {
                          if (phone != null && phone.length >= 10) {
                            _phoneNumberController.text =
                                phone.substring(0, 10);
                            FocusScope.of(context).unfocus();
                          }
                        },
                        validator: (phone) {
                          if (phone == null) {
                            return "Please Enter Phone Number";
                          } else if (phone.length < 10) {
                            return "Phone Number Should 10 Digits";
                          } else if (phone.length > 10) {
                            return "Phone Number Should 10 Digits";
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  Container(
                    width: 140,
                    // margin: const EdgeInsets.all(20),
                    height: 45,
                    decoration: BoxDecoration(
                      color: UtilTheme.productColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OTPScreen(
                                userType: userType,
                              ),
                            ),
                          );
                          // Navigator.pushNamed(context, UtilRoutes.otpRoute);
                        }
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sms,
                            size: 18,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Get OTP",
                            style: UtilTheme.textstyle_18_Bold_DarkBlue,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
