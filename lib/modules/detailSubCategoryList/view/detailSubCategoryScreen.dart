import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summar_me/extras/constants.dart';

class SubCategoryDetail extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SubCategoryDetailState();
  }
}

class _SubCategoryDetailState extends State<SubCategoryDetail> {
  //chips code
  List<String> _options2 = [
    'Kantonalbank',
    'Die Mobiliar',
  ];
  int _choiceIndex = 0;

  @override
  void initState() {
    super.initState();
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
                "Health Insurances",
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
      // color: Colors.red,
      child: ListView.builder(
          itemCount: 3,
          primary: false,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.toNamed('/documentDetailScreen');
              },
              child: new Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                decoration: new BoxDecoration(
                  color: borderBg,
                  border: new Border.all(color: white, width: 2.0),
                  borderRadius: new BorderRadius.circular(12.0),
                ),
                padding: new EdgeInsets.all(5),
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Container(
                          width: 90,
                          // color: Colors.yellow,
                          child: new Image(
                            image: AssetImage(
                                index == 1 ? documentInvoice : document),
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        new Expanded(
                          flex: 2,
                          child: new Container(
                            padding: new EdgeInsets.all(5),
                            // color: Colors.pink,
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                setCommonText('SWICA insurance police',
                                    Colors.black, 13.0, FontWeight.w500, 2),
                                SizedBox(
                                  height: 2,
                                ),
                                setCommonText('Police \"Complementa Medica\"',
                                    Colors.grey, 12.0, FontWeight.w400, 3),
                                SizedBox(
                                  height: 2,
                                ),
                                setCommonText('29. Oktober 2019', Colors.grey,
                                    12.0, FontWeight.w400, 3),
                                SizedBox(
                                  height: 2,
                                ),
                                _buildChoiceChipsSmall(),
                                SizedBox(
                                  height: 2,
                                ),
                                setCommonText('Scanned on 29, Oktober 2019',
                                    Colors.grey, 12.0, FontWeight.w400, 3),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  Widget _buildChoiceChipsSmall() {
    return Container(
      child: Wrap(
        children: List<Widget>.generate(
          _options2.length,
          (int index) {
            return Padding(
              padding: EdgeInsets.only(left: 2, right: 2),
              child: ChoiceChip(
                label: Text(
                  '${_options2[index]}',
                  style: TextStyle(fontFamily: fontFamily),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(24.0))),
                selected: _choiceIndex == index,
                backgroundColor: green,
                visualDensity: VisualDensity.comfortable,
                labelStyle: TextStyle(color: white, fontSize: 8),
                selectedColor: black,
                onSelected: (bool selected) {
                  setState(() {
                    _choiceIndex = selected ? index : null;
                  });
                },
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
