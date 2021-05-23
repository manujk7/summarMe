import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summar_me/extras/constants.dart';
import 'package:summar_me/modules/tabScreens/model/categoriesModel.dart';

class DocumentsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DocumentsPageState();
  }
}

class _DocumentsPageState extends State<DocumentsPage> {
  List<CategoriesModel> _options = [];

  @override
  void initState() {
    super.initState();
    String jsonObjectData =
        '{"categories": [{"categoryName": "All Documents", "image": "assets/images/myDoc.png"}, '
        '{"categoryName": "Private Documents", "image": "assets/images/privateDoc.png"}, '
        '{"categoryName": "Insurances", "image": "assets/images/insurance.png"}, '
        '{"categoryName": "Personal", "image": "assets/images/personalDoc.png"},'
        ' {"categoryName": "Household", "image": "assets/images/houseHold.png"}, '
        '{"categoryName": "Tax", "image":"assets/images/taxDoc.png"}, '
        '{"categoryName": "Education", "image": "assets/images/eduDoc.png"}]}';

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
                "My Documents",
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
                Get.toNamed('/subCategories');
              },
              child: Container(
                margin: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: new Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: borderBg,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
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
