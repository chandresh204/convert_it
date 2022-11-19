import 'package:flutter/material.dart';
import 'number_dialog_supported_widget.dart';

class BinaryValueDialog extends StatefulWidget {
  final Function(String) updateParent;
  const BinaryValueDialog({Key? key, required this.updateParent}) : super(key: key);

  @override
  State<BinaryValueDialog> createState() => _BinaryValueDialogState();
}

class _BinaryValueDialogState extends State<BinaryValueDialog> {

  final NumberDialogSupportedWidgets supportedWidgets = NumberDialogSupportedWidgets();
  String num ='';
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView(
        shrinkWrap: true,
        children: [
          supportedWidgets.calculatorDisplayBox(num),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (num.length < 12) {
                      setState(() {
                        num += '0';
                      });
                    }
                  },
                  child: supportedWidgets.calculatorButton('0', Colors.cyan),
                )
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (num.length < 12) {
                      setState(() {
                        num += '1';
                      });
                    }
                  },
                  child: supportedWidgets.calculatorButton('1', Colors.cyan),
                )
              ),
              IconButton(onPressed: () {
                if (num.isNotEmpty) {
                  num = num.substring(0, num.length - 1);
                }
                setState(() {});
              },
                  icon: const Icon(Icons.backspace, color: Colors.red,)),
              IconButton(onPressed: () {
                Navigator.pop(context);
                widget.updateParent.call(num);
              },
                  icon: const Icon(Icons.check, color: Colors.blueAccent, size: 30,)),
            ]
          ),
        ],
      ),
    );
  }
}
