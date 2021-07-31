import 'package:flutter/material.dart';
import 'package:productdotio/screens/profile.dart';
import 'package:productdotio/utilities/page_route_constants.dart';

import 'package:productdotio/utilities/theme.dart' as UtilTheme;

class StoreOwnerHomeScreen extends StatefulWidget {
  const StoreOwnerHomeScreen({Key? key}) : super(key: key);

  @override
  _StoreOwnerHomeScreenState createState() => _StoreOwnerHomeScreenState();
}

class _StoreOwnerHomeScreenState extends State<StoreOwnerHomeScreen> {
  int _currentIndex = 0;
  List<Widget> _homeWidgets = [
    GridTile(centerText: "Total Orders", bottomText: "460"),
    GridTile(centerText: "Total Orders Full Filled", bottomText: "400"),
    GridTile(centerText: "Orders Per Day", bottomText: "14"),
    GridTile(centerText: "Orders Full Filled Per Day", bottomText: "13"),
    GridTile(centerText: "Todays Revenue", bottomText: "\$200"),
    GridTile(centerText: "Total Revenue", bottomText: "\$3470"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (_currentIndex != 0)
          ? Profile()
          : SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 15),
                    Container(
                      // height: 40,
                      width: double.infinity,
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text("Store rating"),
                                  Text("3.8 / 5"),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: LayoutBuilder(
                                builder: (context, progressconstraint) {
                                  return Container(
                                    height: 20,
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: UtilTheme.greyColor1,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              width: 2,
                                              color: UtilTheme.greyBorderColor,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: progressconstraint.maxWidth *
                                              0.85,
                                          decoration: BoxDecoration(
                                            color: UtilTheme.productColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        Container(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ...List.generate(
                                                8,
                                                (index) => Container(
                                                  width: 0.5,
                                                  color: UtilTheme.greyColor1,
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            title: Text("Pending Orders"),
                            subtitle: Text("9"),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            title: Text("Today Full Filled Orders"),
                            subtitle: Text("4"),
                          ),
                        ),
                      ],
                    ),
                    GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _homeWidgets.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 0,
                        mainAxisSpacing: 0,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (BuildContext ctx, index) {
                        return LayoutBuilder(
                          builder:
                              (BuildContext ctx, BoxConstraints constraints) {
                            return Container(
                              margin: const EdgeInsets.all(15),
                              // padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.8),
                                    offset: Offset(-6.0, -6.0),
                                    blurRadius: 15,
                                  ),
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(6.0, 6.0),
                                    blurRadius: 15,
                                  ),
                                ],
                                color: Color(0xFFEFEEEE),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: _homeWidgets[index],
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        elevation: 8,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: UtilTheme.productColor,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'My Store',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class GridTile extends StatelessWidget {
  final String centerText, bottomText;
  const GridTile({this.centerText: "", this.bottomText: ""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Flexible(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "$centerText",
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Flexible(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "$bottomText",
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
