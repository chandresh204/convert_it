import 'package:flutter/material.dart';
import '../dialog_get_value.dart';
import 'binary_value_dialog.dart';
import 'hex_value_dialog.dart';
import 'octal_value_dialog.dart';

class WidgetNumberRow extends StatelessWidget {
  final String result;
  final String unitTitle;
  final Color color1;
  final Color color2;
  final Function(String) updateParent2;
  const WidgetNumberRow({Key? key, required this.result, required this.unitTitle,
    required this.color1, required this.color2, required this.updateParent2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double unitFont = 25;
    final valueDialog = DialogGetValue(null, updateParent2);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            result,
            style: const TextStyle(fontSize: 22),
          ),
        ),
        Container(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            switch(unitTitle) {
              case 'Decimal' : {
                valueDialog.showDialog111(context, 1, color1, true);
              }
              break;
              case 'Binary': {
                showDialog(context: context, builder: (context) => BinaryValueDialog(updateParent: updateParent2));
              }
              break;
              case 'Octal': {
                showDialog(context: context, builder: (context) => OctalValueDialog(updateParent: updateParent2));
              }
              break;
              case 'Hex': {
                showDialog(context: context, builder: (context) => HexValueDialog(updateParent: updateParent2));
              }
              break;
            }
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
              style: TextStyle(fontSize: unitFont, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
