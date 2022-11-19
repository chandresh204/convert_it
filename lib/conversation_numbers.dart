import 'dart:math';
import 'package:flutter/material.dart';
import 'custom_widgets/widget_number_row.dart';
import 'constants.dart';

class ConversationNumbers extends StatefulWidget {
  const ConversationNumbers({Key? key}) : super(key: key);

  @override
  State<ConversationNumbers> createState() => _ConversationNumbersState();
}

class _ConversationNumbersState extends State<ConversationNumbers> {

  int unitDecimal = 0;
  String unitBinary = '0';
  String unitOctal = '0';
  String unitHex = '0';

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
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.cyan)],
          gradient: LinearGradient(colors: [
            Colors.cyan,
            Colors.cyanAccent,
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
            const Text('Number System', style: TextStyle(fontSize: Constants.appBarFontSize, color: Colors.white),)
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
          WidgetNumberRow(
              updateParent2: updateFromDecimal,
              unitTitle: 'Decimal',
              result: unitDecimal.toString(),
              color1: Colors.cyan,
              color2: Colors.cyanAccent),
          Container(
            height: 20,
          ),
          WidgetNumberRow(
              updateParent2: updateFromBinary,
              unitTitle: 'Binary',
              result: unitBinary,
              color1: Colors.cyan,
              color2: Colors.cyanAccent),
          Container(
            height: 20
          ),
          WidgetNumberRow(
              updateParent2: updateFromOctal,
              unitTitle: 'Octal',
              result: unitOctal,
              color1: Colors.cyan,
              color2: Colors.cyanAccent),
          Container(
            height: 20,
          ),
          WidgetNumberRow(
              updateParent2: updateFromHex,
              unitTitle: 'Hex',
              result: unitHex,
              color1: Colors.cyan,
              color2: Colors.cyanAccent),
        ],
      ),
    );
  }

  updateFromDecimal(String dec) {
    unitDecimal = double.parse(dec).round();
    unitBinary = convertDecimalToBinary(unitDecimal);
    unitOctal = convertDecimalToOctal(unitDecimal);
    unitHex = convertDecimalToHex(unitDecimal);
    setState(() { });
  }

  updateFromBinary(String bin) {
    unitBinary = bin;
    String availBin = bin;
    int decResult = 0;
    int multiplier = 0;
    while(availBin.isNotEmpty) {
      if (availBin.characters.last == '1') {
        decResult += pow(2, multiplier).round();
      }
      availBin = availBin.substring(0, availBin.length-1);
      multiplier++;
    }
    unitDecimal = decResult;
    unitOctal = convertDecimalToOctal(decResult);
    unitHex = convertDecimalToHex(decResult);
    setState(() { });
  }

  updateFromOctal(String oct) {
    unitOctal = oct;
    String availableOct = oct;
    int decResult = 0;
    int multiplier = 0;
    while(availableOct.isNotEmpty) {
      decResult += pow(8, multiplier).round() * int.parse(availableOct.substring(availableOct.length - 1));
      availableOct = availableOct.substring(0, availableOct.length - 1);
      multiplier++;
      print('octal :$decResult and $availableOct');
    }
    unitDecimal = decResult;
    unitBinary = convertDecimalToBinary(decResult);
    unitHex = convertDecimalToHex(decResult);
    setState(() { });
  }

  updateFromHex(String hex) {
    print('hex : $hex');
    unitHex = hex;
    String availableHex = hex;
    int decResult = 0;
    int multiplier = 0;
    while(availableHex.isNotEmpty) {
      String letter = availableHex.substring(availableHex.length - 1);
      print(letter);
      switch(letter) {
        case "a" : {
          decResult += pow(16, multiplier).round() * 10;
        }
        break;
        case "b" : {
          decResult += pow(16, multiplier).round() * 11;
        }
        break;
        case "c" : {
          decResult += pow(16, multiplier).round() * 12;
        }
        break;
        case "d" : {
          decResult += pow(16, multiplier).round() * 13;
        }
        break;
        case "e" : {
          decResult += pow(16, multiplier).round() * 14;
        }
        break;
        case "f" : {
          decResult += pow(16, multiplier).round() * 15;
        }
        break;
        default : {
          int digit = int.parse(letter);
          decResult += pow(16, multiplier).round() * digit;
        }
      }
      availableHex = availableHex.substring(0, availableHex.length - 1);
      multiplier++;
    }
    unitDecimal = decResult;
    unitBinary = convertDecimalToBinary(unitDecimal);
    unitOctal = convertDecimalToOctal(unitDecimal);
    setState(() {});
  }

  String convertDecimalToBinary(int decimal) {
    String resultBinary= '';
    while(decimal > 0) {
      resultBinary = (decimal % 2).toString() + resultBinary;
      decimal = (decimal / 2).floor();
    }
    return resultBinary;
  }

  String convertDecimalToOctal(int decimal) {
    String resultOctal = '';
    while(decimal > 0) {
      resultOctal = (decimal % 8).toString() + resultOctal;
      decimal = (decimal / 8).floor();
    }
    return resultOctal;
  }

  String convertDecimalToHex(int decimal) {
    String resultHex = '';
    while(decimal > 0) {
      int hexValue = decimal % 16;
      switch(hexValue) {
        case 10:
          resultHex = 'a$resultHex';
          break;
        case 11:
          resultHex = 'b$resultHex';
          break;
        case 12:
          resultHex = 'c$resultHex';
          break;
        case 13:
          resultHex = 'd$resultHex';
          break;
        case 14:
          resultHex = 'e$resultHex';
          break;
        case 15:
          resultHex = 'f$resultHex';
          break;
        default:
          resultHex = (decimal % 16).toString() + resultHex;
      }
      decimal = (decimal / 16).floor();
    }
    return resultHex;
  }
}
