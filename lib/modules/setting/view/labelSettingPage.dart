import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summar_me/extras/constants.dart';

class LabelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LabelPageState();
  }
}

class _LabelPageState extends State<LabelPage> {
  List<String> _options = ['American', 'Chinese', 'Thai', 'Japanese'];

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
              Container(
                width: MediaQuery.of(context).size.width,
                color: yellow,
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    "Document label/tags",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: textGrey, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: spacing,
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
                margin: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
                child: new Material(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  color: borderBg,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${_options[index]}",
                              style: Theme.of(context)
                                  .textTheme
                                  .subtitle1
                                  .copyWith(
                                      color: textGrey,
                                      fontWeight: FontWeight.bold),
                            ),
                            Icon(
                              Icons.remove_circle_outline_outlined,
                              color: red,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 1,
                          color: black,
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
