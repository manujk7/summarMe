import 'package:flutter/material.dart';
import 'package:summar_me/extras/constants.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  //search bar params
  final searchController = new TextEditingController();

  //chips code
  List<String> _options = [
    'Kantonalbank',
    'Die Mobiliar',
    'AHV',
    'Rechnung Krankemkasse',
    'Pramie'
  ];

  //chips code
  List<String> _options2 = [
    'Kantonalbank',
    'Die Mobiliar',
  ];
  int _choiceIndex = 0;
  int _choiceIndex2 = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: background,
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 8, right: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hello,",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(color: textGrey, fontWeight: FontWeight.normal),
                ),
                Text(
                  "Marc.",
                  style: Theme.of(context)
                      .textTheme
                      .headline3
                      .copyWith(color: black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: spacing,
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 12.0,
                    ),
                  ]),
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    controller: searchController,
                    onSubmitted: (v) {},
                    textAlignVertical: TextAlignVertical.center,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: "Quick Search",
                      filled: true,
                      fillColor: borderBg,
                      hintStyle: TextStyle(fontSize: 16),
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(
                                12.0) //                 <--- border radius here
                            ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: white, width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(
                                12.0) //                 <--- border radius here
                            ),
                      ),
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.all(20),
                      prefixIcon: Icon(
                        Icons.search,
                        color: textGrey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                Material(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  color: yellow,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(24.0, 12.0, 24.0, 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/recentlyOpen.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  "Recently opened",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        color: textGrey,
                                      ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 45,
                                  width: 45,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/mostlyOpen.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  "Most frequently used",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .copyWith(
                                        color: textGrey,
                                      ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: spacing,
                        ),
                        Text(
                          "Most frequent tags:",
                          style: Theme.of(context).textTheme.subtitle1.copyWith(
                                color: textGrey,
                              ),
                        ),
                        SizedBox(
                          height: spacing * 1 / 2,
                        ),
                        _buildChoiceChips(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recent documents -->",
                        style: Theme.of(context).textTheme.subtitle1.copyWith(
                              color: green,
                            ),
                      ),
                      SizedBox(
                        height: spacing * 1 / 2,
                      ),
                      _setUpDocumentsWidget(),
                      SizedBox(
                        height: spacing * 1 / 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChoiceChips() {
    return Container(
      child: Wrap(
        children: List<Widget>.generate(
          _options.length,
          (int index) {
            return Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child: ChoiceChip(
                label: Text(
                  '${_options[index]}',
                  style: TextStyle(fontFamily: fontFamily),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
                selected: _choiceIndex == index,
                backgroundColor: green,
                labelStyle: TextStyle(color: white, fontSize: 14),
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
                selected: _choiceIndex2 == index,
                backgroundColor: green,
                visualDensity: VisualDensity.comfortable,
                labelStyle: TextStyle(color: white, fontSize: 8),
                selectedColor: black,
                onSelected: (bool selected) {
                  setState(() {
                    _choiceIndex2 = selected ? index : null;
                  });
                },
              ),
            );
          },
        ).toList(),
      ),
    );
  }

  Widget _setUpDocumentsWidget() {
    return new Container(
      height: spacing * 6,
      width: MediaQuery.of(context).size.width,
      // color: Colors.red,
      child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return new Container(
              width: MediaQuery.of(context).size.width * 2 / 3,
              margin: EdgeInsets.only(left: 4, right: 4),
              color: Colors.white,
              padding: new EdgeInsets.all(5),
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Container(
                        width: 100,
                        padding: new EdgeInsets.all(10),
                        // color: Colors.yellow,
                        child: new Image(
                          image: AssetImage(document),
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
                              setCommonText('Doc title', Colors.black, 13.0,
                                  FontWeight.w500, 2),
                              SizedBox(
                                height: 5,
                              ),
                              setCommonText('25.09.2021', Colors.grey, 12.0,
                                  FontWeight.w400, 3),
                              _buildChoiceChipsSmall()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
