import 'package:flutter/material.dart';
import 'custom_widgets/widget_unit_row.dart';

import 'constants.dart';

class ConversationTemperature extends StatefulWidget {
  const ConversationTemperature({Key? key}) : super(key: key);

  @override
  State<ConversationTemperature> createState() => _ConversationTemperatureState();
}

class _ConversationTemperatureState extends State<ConversationTemperature> {
  
  double unitCelsius = 0.0;
  double unitFern = 0.0;
  double unitKelvin = 0.0;

  @override
  void initState() {
    super.initState();
    updateFromCelsius(0.0);
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
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.purple)],
          gradient: LinearGradient(colors: [
            Colors.purple,
            Colors.purpleAccent,
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
              result: unitCelsius,
              conversationValue: 1,
              unitTitle: 'Cels',
              color1: Colors.purple,
              color2: Colors.purpleAccent,
              isLightColors: false,
              updateParent: updateFromCelsius),
          Container(
            height: 20,
          ),
          UnitRowWidget(result: unitFern,
              conversationValue: 1,
              unitTitle: 'Fern',
              color1: Colors.purple,
              color2: Colors.purpleAccent,
              isLightColors: false,
              updateParent: updateFromFern),
          Container(
            height: 20,
          ),
          UnitRowWidget(result: unitKelvin,
              conversationValue: 1,
              unitTitle: 'Kel',
              color1: Colors.purple,
              color2: Colors.purpleAccent,
              isLightColors: false,
              updateParent: updateFromKelvin),
        ],
      ),
    );
  }

/*  Widget _unitRowWidget(double result, double conversationValue, String unitTitle) {
    double unitFont = 25;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          Constants.roundDouble(result).toString(),
          style: TextStyle(fontSize: 32),
        ),
        Container(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            _valueDialog.showDialog111(context, conversationValue, Colors.red);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(blurRadius: 10, color: Colors.red)
                ],
                borderRadius: BorderRadius.circular(32.0),
                gradient: const LinearGradient(
                    colors: [Colors.red, Colors.redAccent])),
            child: Text(
              unitTitle,
              style: TextStyle(
                  fontSize: unitFont, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }  */

  updateFromCelsius(double cel) {
    unitCelsius = cel;
    unitFern = (cel * 9/5) + 32;
    unitKelvin = cel + 273.15;
    setState(() { });
  }

  updateFromFern(double fern) {
    unitFern = fern;
    unitCelsius = (fern - 32) * 5 /9;
    unitKelvin = unitCelsius + 273.15;
    setState(() {});
  }

  updateFromKelvin(double kel) {
    unitKelvin = kel;
    unitCelsius = kel - 273.15;
    unitFern = (unitCelsius * 9/5) + 32;
    setState(() {});
  }
}
