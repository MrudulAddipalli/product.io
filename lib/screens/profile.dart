import 'package:flutter/material.dart';
import 'package:productdotio/utilities/page_route_constants.dart' as UtilRoutes;

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.popAndPushNamed(context, UtilRoutes.loginRoute);
        },
        child: Center(child: Text("Logout\nTap To Logout And Switch Account")));
  }
}
