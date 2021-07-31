import 'package:flutter/material.dart';
import 'package:productdotio/models/category.dart';
import 'package:productdotio/models/store.dart';

import 'package:productdotio/utilities/page_route_constants.dart' as UtilRoutes;
import 'package:productdotio/utilities/theme.dart' as UtilTheme;
import 'package:productdotio/widgets/search_app_bar.dart';
import "package:productdotio/widgets/network_image.dart" as NI;

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  _CustomerHomeScreenState createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  List<Store> _store = [
    Store(
      id: 1,
      storeName: "Dmart Super Market",
      storeAddress: "Vasai East",
      storeRatings: "4.5",
      storeImageURL:
          "https://images.unsplash.com/photo-1568254183919-78a4f43a2877?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YmFrZXJ5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
      isfavourite: false,
    ),
    Store(
      id: 2,
      storeName: "Milk Store",
      storeAddress: "Mumbai",
      storeRatings: "4.5",
      storeImageURL:
          "https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-1foodgroups_dairy_detailfeature.jpg?sfvrsn=23510b0_6",
      isfavourite: true,
    ),
    Store(
      storeName: "Janatha Bazaar",
      storeAddress: "Dadar",
      storeRatings: "4.5",
      storeImageURL:
          "https://media.istockphoto.com/photos/women-clothes-hanging-on-hangers-clothing-rails-fashion-design-picture-id916092484?k=6&m=916092484&s=612x612&w=0&h=tUKYM82W1Vecsjeat6rl6kTnq7iCFq0JYhI2uR3VxMU=",
      isfavourite: false,
    ),
    Store(
      storeName: "Hardware Mart",
      storeAddress: "Virar",
      storeRatings: "4.5",
      storeImageURL:
          "https://media.istockphoto.com/photos/happy-hardware-store-salesperson-picture-id506799199?k=6&m=506799199&s=612x612&w=0&h=We7sOASYsQNoFH3PfO8DN1707NBvv2AKQXkyWuZrwnY=",
      isfavourite: true,
    ),
    Store(
      storeName: "Microsoft",
      storeAddress: "Borivali",
      storeRatings: "4.5",
      storeImageURL:
          "https://media-exp1.licdn.com/dms/image/C511BAQGT-jWgTCavFQ/company-background_10000/0/1566550914476?e=2159024400&v=beta&t=njdcihr2Zutp7Oxli7QprMUMBZ7KNQULxI9J4zjxeVU",
      isfavourite: false,
    ),
    Store(
      storeName: "Dmart Super Market",
      storeAddress: "Vasai East",
      storeRatings: "4.5",
      storeImageURL:
          "https://images.unsplash.com/photo-1568254183919-78a4f43a2877?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YmFrZXJ5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
      isfavourite: true,
    ),
    Store(
      storeName: "Dmart Super Market",
      storeAddress: "Vasai East",
      storeRatings: "4.5",
      storeImageURL:
          "https://images.unsplash.com/photo-1568254183919-78a4f43a2877?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YmFrZXJ5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
      isfavourite: false,
    ),
    Store(
      storeName: "Dmart Super Market",
      storeAddress: "Vasai East",
      storeRatings: "4.5",
      storeImageURL:
          "https://images.unsplash.com/photo-1568254183919-78a4f43a2877?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YmFrZXJ5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
      isfavourite: true,
    ),
    Store(
      storeName: "Dmart Super Market",
      storeAddress: "Vasai East",
      storeRatings: "4.5",
      storeImageURL:
          "https://images.unsplash.com/photo-1568254183919-78a4f43a2877?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YmFrZXJ5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
      isfavourite: false,
    ),
    Store(
      storeName: "Dmart Super Market",
      storeAddress: "Vasai East",
      storeRatings: "4.5",
      storeImageURL:
          "https://images.unsplash.com/photo-1568254183919-78a4f43a2877?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YmFrZXJ5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
      isfavourite: true,
    ),
  ];

  _markFav({@required int itemIndex = 1}) {
    _store[itemIndex].isfavourite = !_store[itemIndex].isfavourite;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEEEE),
      // appBar: AppBar(title: Text("Start Creating Your Store")),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              SearchAppBar(hintText: "Search Products/Stores"),
              SizedBox(height: 15),

              ///
              ///

              ///

              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _store.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    child: LayoutBuilder(
                      builder: (BuildContext ctx, BoxConstraints constraints) {
                        return Stack(
                          children: [
                            Container(
                              height: 160,
                              width: constraints.maxWidth,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: NI.NetworkImage(
                                  imageURL: "${_store[index].storeImageURL}",
                                ),
                              ),
                            ),
                            Container(
                              height: 70,
                              width: constraints.maxWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: UtilTheme.transperantBlackColor,
                              ),
                              // margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: constraints.maxWidth / 3,
                                    height: 3,
                                    color: UtilTheme.productColor,
                                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: Text(
                                      "${_store[index].storeName}",
                                      style: UtilTheme.textstyle_20_White,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 5, 10, 0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            "${_store[index].storeAddress}",
                                            style: UtilTheme.textstyle_white,
                                          ),
                                        ),
                                        Spacer(),
                                        Flexible(
                                          child: Container(
                                            margin:
                                                EdgeInsets.fromLTRB(0, 0, 5, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ...List.generate(
                                                  5,
                                                  (index) => Icon(
                                                    Icons.star,
                                                    size: 14,
                                                    color:
                                                        UtilTheme.productColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        //
                                        Text(
                                          "${_store[index].storeRatings}",
                                          style: UtilTheme.textstyle_15,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // favourite
                            Positioned(
                              right: 15,
                              top: 10,
                              child: GestureDetector(
                                onTap: () {
                                  print("Favorate");
                                  _markFav(itemIndex: index);
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    (_store[index].isfavourite)
                                        ? Icons.favorite_sharp
                                        : Icons.favorite_border_outlined,
                                    size: 15,
                                    color: (_store[index].isfavourite)
                                        ? Color(0xffE90000)
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: UtilTheme.productColor,
        currentIndex: 0, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_sharp),
            label: 'My Favourite',
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
