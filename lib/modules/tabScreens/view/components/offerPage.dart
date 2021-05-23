import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:summar_me/extras/constants.dart';

class OfferPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _OfferPageState();
  }
}

class _OfferPageState extends State<OfferPage> {
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
        child: Center(
          child: Text(
            "No offers available",
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: black, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
