import 'package:flutter/material.dart';

import 'constants.dart';
import 'custom_widgets/widget_unit_row.dart';

class ConversationEnergy extends StatefulWidget {
  const ConversationEnergy({Key? key}) : super(key: key);

  @override
  State<ConversationEnergy> createState() => _ConversationEnergyState();
}

class _ConversationEnergyState extends State<ConversationEnergy> {

  double unitJoule = 0.0;
  double unitCalorie = 0.0;
  double unitWattHour = 0.0;

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
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.orange)],
          gradient: LinearGradient(colors: [
            Colors.orange,
            Colors.orangeAccent,
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
            const Text('Energy', style: TextStyle(fontSize: Constants.appBarFontSize, color: Colors.white),)
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
              result: unitJoule,
              conversationValue: 1/4.184,
              unitTitle: 'Joule',
              color1: Colors.orange,
              color2: Colors.orangeAccent,
              isLightColors: false,
              updateParent: updateFromCalorie),
          Container(
            height: 20,
          ),
          UnitRowWidget(result: unitCalorie,
              conversationValue: 1,
              unitTitle: 'Calorie',
              color1: Colors.orange,
              color2: Colors.orangeAccent,
              isLightColors: false,
              updateParent: updateFromCalorie),
          Container(
            height: 20,
          ),
          UnitRowWidget(result: unitWattHour,
              conversationValue: 860.4207,
              unitTitle: 'Watt-Hour',
              color1: Colors.orange,
              color2: Colors.orangeAccent,
              isLightColors: false,
              updateParent: updateFromCalorie),
        ],
      ),
    );
  }

  updateFromCalorie(double cal) {
    unitJoule = cal * 4.184;
    unitCalorie = cal;
    unitWattHour = cal / 860.4207;
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
