import 'package:flutter/material.dart';
import 'package:productdotio/screens/customer/customer_home_screen.dart';
import 'package:productdotio/screens/login.dart';
import 'package:productdotio/screens/otpscreen.dart';
import 'package:productdotio/screens/store%20owner/store_owner_category_screen.dart';
import 'package:productdotio/screens/store%20owner/store_owner_home_screen.dart';
import 'package:productdotio/utilities/user_type.dart';
import 'package:productdotio/utilities/page_route_constants.dart' as UtilRoutes;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product IO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Quicksand',
      ),
      initialRoute: UtilRoutes.customerHomeScreenRoute,
      // home: LoginScreen(),
      routes: {
        UtilRoutes.loginRoute: (_) => LoginScreen(),
        UtilRoutes.otpRoute: (_) => OTPScreen(userType: UserType.Customer),
        UtilRoutes.storeOwnerHomeScreenRoute: (_) => StoreOwnerHomeScreen(),
        UtilRoutes.storeOwnerCategoryScreenRoute: (_) =>
            StoreOwnerCategoryScreen(),
        UtilRoutes.customerHomeScreenRoute: (_) => CustomerHomeScreen(),
      },
    );
  }
}
