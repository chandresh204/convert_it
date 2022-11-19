import 'package:flutter/material.dart';

import 'constants.dart';
import 'custom_widgets/widget_unit_row.dart';

class ConversationSpeed extends StatefulWidget {
  const ConversationSpeed({Key? key}) : super(key: key);

  @override
  State<ConversationSpeed> createState() => _ConversationSpeedState();
}

class _ConversationSpeedState extends State<ConversationSpeed> {

  double unitMpS = 0.0;
  double unitKmpH = 0.0;
  double unitMlpHr = 0.0;
  double unitKnot = 0.0;

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
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.yellow)],
          gradient: LinearGradient(colors: [
            Colors.yellow,
            Colors.yellowAccent,
          ])),
      child: Column(children: [
        Row(
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.black,)
            ),
            const Text('Speed', style: TextStyle(fontSize: Constants.appBarFontSize, color: Colors.black),)
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
              result: unitMpS,
              conversationValue: 1,
              unitTitle: 'm/s',
              color1: Colors.yellow,
              color2: Colors.yellowAccent,
              isLightColors: true,
              updateParent: updateFromMps),
          Container(
            height: 20,
          ),
          UnitRowWidget(result: unitKmpH,
              conversationValue: 1 / 3.6,
              unitTitle: 'km/hr',
              color1: Colors.yellow,
              color2: Colors.yellowAccent,
              isLightColors: true,
              updateParent: updateFromMps),
          Container(
            height: 20,
          ),
          UnitRowWidget(result: unitMlpHr,
              conversationValue: 1 / 2.2369,
              unitTitle: 'Mil/hr',
              color1: Colors.yellow,
              color2: Colors.yellowAccent,
              isLightColors: true,
              updateParent: updateFromMps),
          Container(
            height: 20,
          ),
          UnitRowWidget(result: unitKnot,
              conversationValue: 1 / 1.9438,
              unitTitle: 'Knot',
              color1: Colors.yellow,
              color2: Colors.yellowAccent,
              isLightColors: true,
              updateParent: updateFromMps),
        ],
      ),
    );
  }

  updateFromMps(double mPs) {
    unitMpS = mPs;
    unitKmpH = mPs * 3.6;
    unitMlpHr = mPs * 2.2369;
    unitKnot = mPs * 1.9438;
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
