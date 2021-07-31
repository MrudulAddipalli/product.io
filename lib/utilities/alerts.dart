import 'package:flutter/material.dart';

class AlertWidgetHelper {
  //
  //
  static AlertWidgetHelper? _instance;
  AlertWidgetHelper._();
  static AlertWidgetHelper get getInstance =>
      _instance ??= AlertWidgetHelper._();

  Future loading(BuildContext context, String textmessage) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext cx) {
        return AlertDialog(
          content: Container(
            height: 70,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.all(15), child: Text("$textmessage")),
                LinearProgressIndicator(),
              ],
            ),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        );
      },
    );
  }
}
