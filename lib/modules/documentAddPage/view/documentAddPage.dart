import 'dart:io';
import 'dart:typed_data';

import 'package:edge_detection/edge_detection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:summar_me/extras/constants.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

class DocumentAddPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DocumentAddPageState();
  }
}

class _DocumentAddPageState extends State<DocumentAddPage> {
  //search bar params
  final searchController = new TextEditingController();

  //chips code
  List<String> _options = [
    'KeyWord1',
    'KeyWord2',
    'KeyWord3',
  ]; //chips code

  List<String> _optionsLabel = [
    'Label1',
    'Label2',
    'Label3',
    'Label4',
  ];

  List<String> _optionsReminder = [
    'In 3 days',
    'In 7 days',
    'In 30 days',
    'Custom date',
    'Custom time',
  ];

  //chips code
  List<String> _options2 = [
    'Kantonalbank',
    'Die Mobiliar',
  ];
  int _choiceIndex = 0;
  int _choiceIndex2 = 0;

  //image code
  String imageString;
  bool controllerSwitch = false;
  final nameController = new TextEditingController();

  @override
  void initState() {
    if (Constants.openScanner) {
      initPlatformState();
    } else {
      Constants.openScanner = false;
    }

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
            margin: EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  color: yellow,
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      "What should I know about the document?",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle1.copyWith(
                          color: textGrey, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Under Development,",
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: textGrey, fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: spacing,
                ),
                Center(
                  child: RaisedButton(
                    color: green,
                    onPressed: () {
                      initPlatformState();
                    },
                    child: Text(
                      "Add Page",
                      style: TextStyle(color: white),
                    ),
                  ),
                ),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                Text(
                  "Filename",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(color: textGrey, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                fileName(),
                SizedBox(
                  height: spacing,
                ),
                Text(
                  "Category(Folder)",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(color: textGrey, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                category(),
                SizedBox(
                  height: spacing,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Label/Tags",
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: textGrey, fontWeight: FontWeight.w900),
                    ),
                    Icon(
                      Icons.add,
                      color: black,
                      size: 24,
                    ),
                  ],
                ),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                labelTags(),
                SizedBox(
                  height: spacing,
                ),
                taxRelated(),
                SizedBox(
                  height: spacing,
                ),
                Text(
                  "Reminder",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(color: textGrey, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                reminder(),
                SizedBox(
                  height: spacing,
                ),
                Text(
                  "Comments/Notes",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle2
                      .copyWith(color: textGrey, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: spacing * 1 / 2,
                ),
                notes(),
                SizedBox(
                  height: spacing,
                ),
                bottomBar()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget fileName() {
    return Material(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      color: borderBg,
      child: Container(
        margin: EdgeInsets.fromLTRB(8.0, 8.0, 24.0, 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              textAlign: TextAlign.start,
              keyboardType: TextInputType.text,
              obscureText: false,
              controller: nameController,
              decoration: InputDecoration(
                hintText: "File Name",
                filled: true,
                fillColor: borderBg,
                hintStyle: TextStyle(fontSize: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: EdgeInsets.all(8),
              ),
            ),
            _buildChoiceChips(),
          ],
        ),
      ),
    );
  }

  Widget category() {
    return Material(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      color: borderBg,
      child: Container(
        margin: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  flex: 5,
                  child: TextField(
                    textAlign: TextAlign.start,
                    keyboardType: TextInputType.text,
                    obscureText: false,
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: "Category Recommendation",
                      filled: true,
                      fillColor: borderBg,
                      hintStyle: TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.folder_rounded,
                    color: green,
                    size: 40,
                  ),
                ),
              ],
            ),
            _buildChoiceChips(),
          ],
        ),
      ),
    );
  }

  Widget notes() {
    return TextField(
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      obscureText: false,
      controller: nameController,
      decoration: InputDecoration(
        hintText: "Notes here..",
        filled: true,
        fillColor: borderBg,
        hintStyle: TextStyle(fontSize: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        contentPadding: EdgeInsets.all(20),
      ),
    );
  }

  Widget taxRelated() {
    return Material(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      color: borderBg,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Tax-related",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(color: textGrey, fontWeight: FontWeight.normal),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "This document is related to tax declaration.",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  width: 8,
                ),
                FlutterSwitch(
                  width: 50.0,
                  height: 25.0,
                  valueFontSize: 0.0,
                  toggleSize: 15.0,
                  activeColor: green,
                  value: controllerSwitch,
                  borderRadius: 20.0,
                  showOnOff: true,
                  onToggle: (val) {
                    print(val);
                    setState(() {
                      controllerSwitch = !controllerSwitch;
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget bottomBar() {
    return Material(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      color: yellow,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Cancel",
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                        color: green,
                        fontWeight: FontWeight.w900,
                      ),
                ),
                Container(
                  height: 45,
                  width: 45,
                  child: Image(
                    image: AssetImage('assets/icons/scan.png'),
                    fit: BoxFit.contain,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('/successPage');
                    // if (Constants.imagePath.isNotEmpty) {
                    //   OpenFile.open(Constants.imagePath);
                    // } else {
                    //   Get.snackbar("Something Went Wrong", "Please try again");
                    // }
                  },
                  child: Text(
                    "Save",
                    style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: green,
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget labelTags() {
    return Material(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      color: borderBg,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildChoiceChipsLabel(),
          ],
        ),
      ),
    );
  }

  Widget reminder() {
    return Material(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      color: borderBg,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildChoiceChipsReminder(),
          ],
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
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  side: const BorderSide(color: green, width: 0.0),
                ),
                selected: _choiceIndex == index,
                backgroundColor: white,
                labelStyle: TextStyle(color: black, fontSize: 12),
                selectedColor: green,
                onSelected: (bool selected) {
                  setState(() {
                    _choiceIndex = selected ? index : null;
                  });
                },
              ),
            );
          },
        ).toList(),
        direction: Axis.horizontal,
      ),
    );
  }

  Widget _buildChoiceChipsLabel() {
    return Container(
      child: Wrap(
        children: List<Widget>.generate(
          _optionsLabel.length,
          (int index) {
            return Padding(
              padding: EdgeInsets.only(left: 4, right: 4),
              child: ChoiceChip(
                label: Text(
                  '${_optionsLabel[index]}',
                  style: TextStyle(fontFamily: fontFamily),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  side: const BorderSide(color: green, width: 0.0),
                ),
                selected: _choiceIndex == index,
                backgroundColor: white,
                labelStyle: TextStyle(color: black, fontSize: 12),
                selectedColor: green,
                onSelected: (bool selected) {
                  setState(() {
                    _choiceIndex = selected ? index : null;
                  });
                },
              ),
            );
          },
        ).toList(),
        direction: Axis.horizontal,
      ),
    );
  }

  Widget _buildChoiceChipsReminder() {
    return Container(
      child: Wrap(
        children: List<Widget>.generate(
          _optionsReminder.length,
          (int index) {
            return Padding(
              padding: EdgeInsets.only(left: 6, right: 6),
              child: ChoiceChip(
                label: Text(
                  '${_optionsReminder[index]}',
                  style: TextStyle(fontFamily: fontFamily),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  side: const BorderSide(color: green, width: 0.0),
                ),
                selected: _choiceIndex == index,
                backgroundColor: white,
                labelStyle: TextStyle(color: black, fontSize: 12),
                selectedColor: green,
                onSelected: (bool selected) {
                  setState(() {
                    _choiceIndex = selected ? index : null;
                  });
                },
              ),
            );
          },
        ).toList(),
        direction: Axis.horizontal,
      ),
    );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String imagePathLocal;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      imagePathLocal = await EdgeDetection.detectEdge;
      if (imagePathLocal != null) {
        String name = DateTime.now().millisecondsSinceEpoch.toString();
        Directory appDocDirectory = await getExternalStorageDirectory();

        await Directory(appDocDirectory.path + '/' + 'MyImages')
            .create(recursive: true)
// The created directory is returned as a Future.
            .then((Directory directory) {
          print('Path of New Dir Images: ' + directory.path);
        });
        await Directory(appDocDirectory.path + '/' + 'MyPdf')
            .create(recursive: true)
// The created directory is returned as a Future.
            .then((Directory directory) {
          print('Path of New Dir Pdf: ' + directory.path);
        });
        //move file to our directory
        File newFile = await File(imagePathLocal)
            .rename('${appDocDirectory.path}/MyImages/image_$name.jpeg');
        //Create a new PDF document.
        final PdfDocument document = PdfDocument();
//Read image data.
        final Uint8List imageData = File(newFile.path).readAsBytesSync();
//Load the image using PdfBitmap.
        final PdfBitmap image = PdfBitmap(imageData);
//Draw the image to the PDF page.
        document.pages
            .add()
            .graphics
            .drawImage(image, const Rect.fromLTWH(0, 0, 500, 700));
// Save the document.
        File pdfFile =
            await File('${appDocDirectory.path}/MyPdf/DocumentScanned$name.pdf')
                .writeAsBytes(document.save());
// Dispose the document.
        document.dispose();

        //delete the directory
        await Directory(appDocDirectory.path + '/' + 'MyImages')
            .delete(recursive: true);
        Constants.imagePath = pdfFile.path;
        Get.snackbar("Success", "Please save the document to view.");
      }
      // OpenFile.open(pdfFile.path);
    } on PlatformException {
      imagePathLocal = 'Failed.';
      Constants.imagePath = '';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    // setState(() {
    //   _imagePath = imagePath;
    // });
    // print(_imagePath);
  }
}
