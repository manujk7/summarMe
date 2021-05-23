import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summar_me/extras/constants.dart';
import 'package:summar_me/modules/documentDetail/model/documentDetailModel.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class DocumentDetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DocumentDetailPageState();
  }
}

class _DocumentDetailPageState extends State<DocumentDetailPage> {
  List<DocumentDetailModel> _options = [];
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    String jsonObjectData =
        '{"details": [{"documentInfo": "Policy-No.", "infoNo": "747858347"}, '
        '{"documentInfo": "Insurance Provider", "infoNo": "SWICA"}, '
        ' {"documentInfo": "Policy-Type", "infoNo": "Complementa Medica"},'
        '{"documentInfo": "Policy-Date", "infoNo": "29.10.2019"},'
        '{"documentInfo": "Amount", "infoNo": "CHF 283.409"}]}';
    var documentDetailObj = jsonDecode(jsonObjectData)['details'] as List;
    _options = documentDetailObj
        .map((tagJson) => DocumentDetailModel.fromJson(tagJson))
        .toList();

    print(_options);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
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
                "SWICA Insurance Policy",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: textGrey, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: spacing * 1 / 2,
              ),
              CarouselSlider(
                items: imageSliders,
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    height: 350,
                    viewportFraction: 0.95),
                carouselController: _controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                    decoration: new BoxDecoration(
                      color: white,
                      border: new Border.all(color: green, width: 2.0),
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                    decoration: new BoxDecoration(
                      color: white,
                      border: new Border.all(color: green, width: 2.0),
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Share',
                      style: TextStyle(
                        color: green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                    decoration: new BoxDecoration(
                      color: white,
                      border: new Border.all(color: green, width: 2.0),
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Export',
                      style: TextStyle(
                        color: green,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                    decoration: new BoxDecoration(
                      color: white,
                      border: new Border.all(color: red, width: 2.0),
                      borderRadius: new BorderRadius.circular(8.0),
                    ),
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        color: red,
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              _setUpDocumentsWidget()
            ],
          ),
        ),
      ),
    );
  }

  final List<Widget> imageSliders = imgList
      .map(
        (item) => Container(
          margin: EdgeInsets.all(4.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            child: Container(
              child: Column(
                children: [
                  Stack(
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          child: Image.network(item,
                              fit: BoxFit.cover, width: 1000.0)),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    color: yellow,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 16, right: 16),
                      child: Text(
                        '${imgList.indexOf(item) + 1}/${imgList.length}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
      .toList();

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
                margin: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 8.0),
                color: white,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                            flex: 4,
                            child: new Material(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              color: green,
                              child: Center(
                                child: Container(
                                  margin: EdgeInsets.all(6),
                                  child: Text(
                                    "${_options[index].documentInfo}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .subtitle2
                                        .copyWith(
                                            color: white,
                                            fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            flex: 5,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "${_options[index].infoNo}",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(
                                        color: black,
                                        fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.warning_sharp,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
