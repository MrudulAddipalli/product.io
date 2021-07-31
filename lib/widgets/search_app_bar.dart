import 'package:flutter/material.dart';
import 'package:productdotio/utilities/theme.dart' as UtilTheme;

class SearchAppBar extends StatefulWidget {
  SearchAppBar({this.hintText: ""});
  String hintText;
  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  //
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: Row(
        children: [
          Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(40),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40), color: Colors.white),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    // margin: EdgeInsets.all(10),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: UtilTheme.productColor,
                        borderRadius: BorderRadius.circular(40)),
                    child: Icon(
                      Icons.search,
                      size: 25,
                      color: Colors.white,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      width: MediaQuery.of(context).size.width * (6 / 9),
                      child: TextFormField(
                        textInputAction: TextInputAction.done,
                        controller: _searchController,
                        keyboardType: TextInputType.text,
                        style: UtilTheme.textstyle_17,
                        decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "${widget.hintText}",
                          hintStyle: UtilTheme.textstyle_17,
                        ),
                        onTap: () {
                          print("search Category");
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          InkWell(
            onTap: () {
              print("mic");
            },
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(40),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Colors.white),
                height: 50,
                width: 50,
                child: Icon(
                  Icons.mic,
                  size: 25,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
