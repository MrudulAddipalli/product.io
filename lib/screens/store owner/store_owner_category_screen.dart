import 'package:flutter/material.dart';
import 'package:productdotio/models/category.dart';

import 'package:productdotio/utilities/page_route_constants.dart' as UtilRoutes;
import 'package:productdotio/utilities/theme.dart' as UtilTheme;
import "package:productdotio/widgets/network_image.dart" as NI;
import 'package:productdotio/widgets/search_app_bar.dart';

class StoreOwnerCategoryScreen extends StatefulWidget {
  const StoreOwnerCategoryScreen({Key? key}) : super(key: key);

  @override
  _StoreOwneCategoryScreenState createState() =>
      _StoreOwneCategoryScreenState();
}

class _StoreOwneCategoryScreenState extends State<StoreOwnerCategoryScreen> {
  bool _showFloatingButton = false;

  List<Category> _categories = [
    Category(
      id: 4,
      categoryName: "Bakery And Snacks",
      categoryImageURL:
          "https://images.unsplash.com/photo-1568254183919-78a4f43a2877?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YmFrZXJ5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80",
      isSelected: false,
    ),
    Category(
      id: 5,
      categoryName: "Dairy",
      categoryImageURL:
          "https://www.healthyeating.org/images/default-source/home-0.0/nutrition-topics-2.0/general-nutrition-wellness/2-2-2-1foodgroups_dairy_detailfeature.jpg?sfvrsn=23510b0_6",
      isSelected: false,
    ),
    Category(
      id: 6,
      categoryName: "Beverages",
      categoryImageURL:
          "https://www.foodbusinessnews.net/ext/resources/2020/2/beverages-with-healthy-twist.jpg?1580845900",
      isSelected: false,
    ),
    Category(
      id: 7,
      categoryName: "Mens Clothing",
      categoryImageURL:
          "https://media.istockphoto.com/photos/stylish-business-clothing-for-businessman-picture-id504742864?k=6&m=504742864&s=612x612&w=0&h=shzIbJOWln2-6iACNqETwY-K2gnT1uv0ArMM8ndkBsk=",
      isSelected: false,
    ),
    Category(
      id: 9,
      categoryName: "Womens Clothing",
      categoryImageURL:
          "https://media.istockphoto.com/photos/women-clothes-hanging-on-hangers-clothing-rails-fashion-design-picture-id916092484?k=6&m=916092484&s=612x612&w=0&h=tUKYM82W1Vecsjeat6rl6kTnq7iCFq0JYhI2uR3VxMU=",
      isSelected: false,
    ),
    Category(
      id: 10,
      categoryName: "Foot Wear",
      categoryImageURL:
          "https://d1af89beukha9h.cloudfront.net/wp-content/uploads/2018/10/shoe-companies.jpg",
      isSelected: false,
    ),
    Category(
      id: 11,
      categoryName: "Hardware",
      categoryImageURL:
          "https://media.istockphoto.com/photos/happy-hardware-store-salesperson-picture-id506799199?k=6&m=506799199&s=612x612&w=0&h=We7sOASYsQNoFH3PfO8DN1707NBvv2AKQXkyWuZrwnY=",
      isSelected: false,
    ),
    Category(
      id: 12,
      categoryName: "IT Software Solutions",
      categoryImageURL:
          "https://media-exp1.licdn.com/dms/image/C511BAQGT-jWgTCavFQ/company-background_10000/0/1566550914476?e=2159024400&v=beta&t=njdcihr2Zutp7Oxli7QprMUMBZ7KNQULxI9J4zjxeVU",
      isSelected: false,
    ),
    Category(
      id: 1,
      categoryName: "Fresh Fruits And Vegetables",
      categoryImageURL:
          "https://www.freshproduceshoppe.com/wp-content/uploads/2018/05/3-2-vegetable-transparent.png",
      isSelected: false,
    ),
    Category(
      id: 2,
      categoryName: "Cookin Oil And Ghee",
      categoryImageURL:
          "data:image/jpeg;base64,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",
      isSelected: false,
    ),
    Category(
      id: 3,
      categoryName: "Meat And Fish",
      categoryImageURL:
          "https://cdn.yamatoscale.com/wp-content/uploads/2016/04/Fisch-FIlet_01_01_OH.jpg",
      isSelected: false,
    ),
  ];

  _selectItem({@required int itemIndex = 1}) {
    _categories[itemIndex].isSelected = !_categories[itemIndex].isSelected;
    setState(() {
      _showFloatingButton = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _showFloatingButton
          ? FloatingActionButton.extended(
              hoverColor: UtilTheme.productColor,
              elevation: 5,
              onPressed: () {
                Navigator.pushNamed(
                    context, UtilRoutes.storeOwnerHomeScreenRoute);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(35))),
              icon: Icon(Icons.next_plan),
              label: Text("Proceed"),
            )
          : null,

      backgroundColor: Color(0xFFEFEEEE),
      // appBar: AppBar(title: Text("Start Creating Your Store")),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '''Start Creating Your Store''',
                    textAlign: TextAlign.center,
                    style: UtilTheme.textstyle_25_Bold_DarkBlue,
                  ),
                ],
              ),
              SizedBox(height: 5),
              Text(
                '''Select Store Item Category For Your Store''',
                textAlign: TextAlign.center,
                style: UtilTheme.textstyle_17,
              ),
              SizedBox(height: 10),
              SearchAppBar(hintText: "Search For Category"),
              SizedBox(height: 15),

              ///
              ///
              ///
              GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.85,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext ctx, index) {
                  return LayoutBuilder(
                    builder: (BuildContext ctx, BoxConstraints constraints) {
                      return GestureDetector(
                        onTap: () {
                          _selectItem(itemIndex: index);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(15),
                          // padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            boxShadow: [
                              (_categories[index].isSelected)
                                  ? BoxShadow(
                                      color: UtilTheme.productColor,
                                      offset: Offset(-6.0, -6.0),
                                      blurRadius: 5,
                                    )
                                  : BoxShadow(
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
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  height: constraints.minHeight * 0.6,
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(500),
                                    child: NI.NetworkImage(
                                      imageURL:
                                          "${_categories[index].categoryImageURL}",
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    alignment: Alignment.bottomCenter,
                                    child: Text(
                                      "${_categories[index].categoryName}",
                                      softWrap: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
