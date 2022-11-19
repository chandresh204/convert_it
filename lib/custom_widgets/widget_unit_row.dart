import 'package:flutter/material.dart';

import '../constants.dart';
import '../dialog_get_value.dart';

class UnitRowWidget extends StatelessWidget {
  final double result;
  final double conversationValue;
  final String unitTitle;
  final Color color1;
  final Color color2;
  final bool isLightColors;
  final Function(double) updateParent;
  const UnitRowWidget({Key? key, required this.result, required this.conversationValue,
    required this.color1, required this.color2, required this.isLightColors,
    required this.unitTitle, required this.updateParent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final valueDialog = DialogGetValue(updateParent, null);
    double unitFont = 25;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
    //      Constants.roundDouble(result).toStringAsExponential(3),
          Constants.doubleToString(result),
          style: const TextStyle(fontSize: 32),
        ),
        Container(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            valueDialog.showDialog111(context, conversationValue, color1, false);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 10, color: color1)
                ],
                borderRadius: BorderRadius.circular(32.0),
                gradient: LinearGradient(
                    colors: [color1, color2])),
            child: Text(
              unitTitle,
              style: isLightColors ? TextStyle(
                  fontSize: unitFont) : TextStyle(fontSize: unitFont, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
