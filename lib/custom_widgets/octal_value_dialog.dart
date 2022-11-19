import 'package:flutter/material.dart';

import 'number_dialog_supported_widget.dart';

class OctalValueDialog extends StatefulWidget {
  final Function(String s) updateParent;
  const OctalValueDialog({Key? key, required this.updateParent}) : super(key: key);

  @override
  State<OctalValueDialog> createState() => _OctalValueDialogState();
}

class _OctalValueDialogState extends State<OctalValueDialog> {

  final NumberDialogSupportedWidgets supportedWidgets = NumberDialogSupportedWidgets();
  String num = '';
  final Color buttonColor = Colors.cyan;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: ListView(
        shrinkWrap: true,
        children: [
          supportedWidgets.calculatorDisplayBox(num),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (num.length < 9) {
                      num += '7';
                      setState(() {});
                    }
                  },
                  child: supportedWidgets.calculatorButton( '7', buttonColor),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(child: GestureDetector(
                onTap: () {
                  if (num.length < 9) {
                    num += '4';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('4', buttonColor),
              )),
              Expanded(child: GestureDetector(
                onTap: () {
                  if (num.length < 9) {
                    num += '5';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('5', buttonColor),
              )),
              Expanded(child: GestureDetector(
                onTap: () {
                  if (num.length < 9) {
                    num += '6';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('6', buttonColor),
              )),
            ],
          ),
          Row(
            children: [
              Expanded(child: GestureDetector(
                onTap: () {
                  if (num.length < 9) {
                    num += '1';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('1', buttonColor),
              )),
              Expanded(child: GestureDetector(
                onTap: () {
                  if (num.length < 9) {
                    num += '2';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('2', buttonColor),
              )),
              Expanded(child: GestureDetector(
                onTap: () {
                  if (num.length < 9) {
                    num += '3';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('3', buttonColor),
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                      widget.updateParent.call(num);
                    },
                    icon: const Icon(Icons.check, color: Colors.blue,)),
              ),
              Expanded(child: GestureDetector(
                onTap: () {
                  if (num.length < 9) {
                    num += '0';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('0', buttonColor),
              )),
              Expanded(
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (num.isNotEmpty) {
                        num = num.substring(0, num.length - 1);
                      }
                    });
                  },
                  icon: const Icon(Icons.backspace, color: Colors.red,),),
              ),
            ],
          )
        ],
      ),
    );
  }
}
