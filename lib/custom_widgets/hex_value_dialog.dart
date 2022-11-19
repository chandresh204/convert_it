import 'package:flutter/material.dart';

import 'number_dialog_supported_widget.dart';

class HexValueDialog extends StatefulWidget {
  final Function(String s) updateParent;
  const HexValueDialog({Key? key, required this.updateParent}) : super(key: key);

  @override
  State<HexValueDialog> createState() => _HexValueDialogState();
}

class _HexValueDialogState extends State<HexValueDialog> {

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
                    if(num.length < 9) {
                        num += 'b';
                        setState(() {});
                    }
                  },
                  child: supportedWidgets.calculatorButton( 'B', buttonColor),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if(num.length < 9) {
                      num += 'c';
                      setState(() {});
                    }
                  },
                  child: supportedWidgets.calculatorButton( 'C', buttonColor),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if(num.length < 9) {
                      num += 'd';
                      setState(() {});
                    }
                  },
                  child: supportedWidgets.calculatorButton( 'D', buttonColor),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if(num.length < 9) {
                      num += 'e';
                      setState(() {});
                    }
                  },
                  child: supportedWidgets.calculatorButton( 'E', buttonColor),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if(num.length < 9) {
                      num += 'f';
                      setState(() {});
                    }
                  },
                  child: supportedWidgets.calculatorButton( 'F', buttonColor),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(child: GestureDetector(
                onTap: () {
                  if(num.length < 9) {
                    num += '6';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('6', buttonColor),
              )),
              Expanded(child: GestureDetector(
                onTap: () {
                  if(num.length < 9) {
                    num += '7';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('7', buttonColor),
              )),
              Expanded(child: GestureDetector(
                onTap: () {
                  if(num.length < 9) {
                    num += '8';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('8', buttonColor),
              )),
              Expanded(child: GestureDetector(
                onTap: () {
                  if(num.length < 9) {
                    num += '9';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('9', buttonColor),
              )),
              Expanded(child: GestureDetector(
                onTap: () {
                  if(num.length < 9) {
                    num += 'a';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('A', buttonColor),
              )),
            ],
          ),
          Row(
            children: [
              Expanded(child: GestureDetector(
                onTap: () {
                  if(num.length < 9) {
                    num += '1';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('1', buttonColor),
              )),
              Expanded(child: GestureDetector(
                onTap: () {
                  if(num.length < 9) {
                    num += '2';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('2', buttonColor),
              )),
              Expanded(child: GestureDetector(
                onTap: () {
                  if(num.length < 9) {
                    num += '3';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('3', buttonColor),
              )),
              Expanded(child: GestureDetector(
                onTap: () {
                  if(num.length < 9) {
                    num += '4';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('4', buttonColor),
              )),
              Expanded(child: GestureDetector(
                onTap: () {
                  if(num.length < 9) {
                    num += '5';
                    setState(() {});
                  }
                },
                child: supportedWidgets.calculatorButton('5', buttonColor),
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
                  if(num.length < 9) {
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
