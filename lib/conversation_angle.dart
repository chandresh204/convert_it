import 'package:flutter/material.dart';

import 'constants.dart';
import 'custom_widgets/widget_unit_row.dart';

class ConversationAngle extends StatefulWidget {
  const ConversationAngle({Key? key}) : super(key: key);

  @override
  State<ConversationAngle> createState() => _ConversationAngleState();
}

class _ConversationAngleState extends State<ConversationAngle> {

  double unitDegree = 0.0;
  double unitRadian = 0.0;
  double unitGradian = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _myAppBar(),
          Expanded(child: _body())
        ],
      ),
    );
  }

  Widget _myAppBar() {
    return Container(
      padding: const EdgeInsets.only(top: Constants.constAppBarTopPadding,
          bottom: Constants.constAppBarBottomPadding),
      decoration: const BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.pink)],
          gradient: LinearGradient(colors: [
            Colors.pink,
            Colors.pinkAccent,
          ])),
      child: Column(children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white,)
            ),
            const Text('Temperature', style: TextStyle(fontSize: Constants.appBarFontSize, color: Colors.white),)
          ],
        ),
      ]),
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          UnitRowWidget(
              result: unitDegree,
              conversationValue: 1,
              unitTitle: 'Deg',
              color1: Colors.pink,
              color2: Colors.pinkAccent,
              isLightColors: false,
              updateParent: updateFromDegree),
          Container(
            height: 20,
          ),
          UnitRowWidget(result: unitRadian,
              conversationValue: (180 / 3.141593),
              unitTitle: 'Rad',
              color1: Colors.pink,
              color2: Colors.pinkAccent,
              isLightColors: false,
              updateParent: updateFromDegree),
          Container(
            height: 20,
          ),
          UnitRowWidget(result: unitGradian,
              conversationValue: 18 / 20,
              unitTitle: 'Grad',
              color1: Colors.pink,
              color2: Colors.pinkAccent,
              isLightColors: false,
              updateParent: updateFromDegree),
        ],
      ),
    );
  }

  updateFromDegree(double deg) {
    unitDegree = deg;
    unitRadian = (deg * 3.141593) / 180;
    unitGradian = (unitRadian * 200) / 3.141593;
    setState(() { });
  }

/*  updateFromRadian(double rad) {
    unit
    unitFern = fern;
    unitCelsius = (fern - 32) * 5 /9;
    unitKelvin = unitCelsius + 273.15;
    setState(() {});
  }

  updateFromGradian(double grad) {
    unitKelvin = kel;
    unitCelsius = kel - 273.15;
    unitFern = (unitCelsius * 9/5) + 32;
    setState(() {});
  }  */
}
