import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summar_me/extras/constants.dart';
import 'package:summar_me/modules/tabScreens/model/categoriesModel.dart';

class SubCategories extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubCategoriesState();
  }
}

class _SubCategoriesState extends State<SubCategories> {
  List<CategoriesModel> _options = [];

  @override
  void initState() {
    super.initState();
    String jsonObjectData =
        '{"categories": [{"categoryName": "Health Care", "image": "assets/images/healthCare.png"}, '
        '{"categoryName": "Private", "image": "assets/images/privateDoc.png"}, '
        ' {"categoryName": "Household", "image": "assets/images/houseHold.png"}]}';

    var categoryJsonObj = jsonDecode(jsonObjectData)['categories'] as List;
    _options = categoryJsonObj
        .map((tagJson) => CategoriesModel.fromJson(tagJson))
        .toList();

    print(_options);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: background,
      appBar: new AppBar(
        title: Image.asset(
          brandNameLogo,
          fit: BoxFit.scaleDown,
          width: 160,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: new IconThemeData(color: grey),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: spacing,
              ),
              Text(
                "Insurance Subcategories",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: textGrey, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: spacing * 1 / 2,
              ),
              _setUpDocumentsWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _setUpDocumentsWidget() {
    return new Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: _options.length,
          primary: false,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Get.toNamed('/subCategoryDetail');
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                child: new Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: borderBg,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Container(
                                height: 40,
                                width: 40,
                                child: Image(
                                  image: AssetImage(_options[index].image),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                "${_options[index].categoryName}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: textGrey,
                                        fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
