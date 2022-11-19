import 'package:flutter/material.dart';

class DialogGetValue {
  Function(double meter)? updateParent;
  Function(String decimal)? updateParent2;
  DialogGetValue(this.updateParent,this.updateParent2);

  String selectedValue = '';

  showDialog111(BuildContext context, double multiParam, Color color1, bool unitInString) {
    TextEditingController _controller = TextEditingController();
    showDialog(context: context, builder: (context) {
      return Dialog(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children : [
              const Text('Please Enter Value:', style: TextStyle(fontSize: 22),),
              TextField(
                decoration: InputDecoration(
                 focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: color1)
                  ),
                ),
                cursorColor: color1,
                controller: _controller,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30),
                keyboardType: TextInputType.number,
                autofocus: true,
              ),
              ElevatedButton(onPressed: () {
                selectedValue = _controller.text;
                if (unitInString && this.updateParent2 != null) {
                  this.updateParent2?.call(selectedValue);
                } else {
                  updateParent?.call(double.parse(selectedValue) * multiParam);
                }
                Navigator.pop(context);
              }, child: Text('Submit'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith((states) => color1),
                ),)
            ]
          ),
        ),
      );
    });
  }
}