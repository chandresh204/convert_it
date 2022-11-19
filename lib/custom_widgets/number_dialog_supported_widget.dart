import 'package:flutter/material.dart';

class NumberDialogSupportedWidgets {

  Widget calculatorDisplayBox(String displayValue) {
    return Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: const [
              BoxShadow(blurRadius: 10, blurStyle: BlurStyle.outer, color: Colors.cyan)
            ]
        ),
        alignment: Alignment.centerRight,
        child: Text(displayValue, style: const TextStyle(fontSize: 32),));
  }

  Widget calculatorButton(String value, Color color) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: 50,
      alignment: Alignment.center ,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(blurRadius: 8, color: color)
        ],
      ),
      child: Text(value, style: const TextStyle(fontSize: 22),),
    );
  }
}