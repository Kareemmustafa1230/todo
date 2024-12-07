import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EidetTask extends StatelessWidget {
  String texts;
  String change ;
  EidetTask({required this.texts, required this.change});
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.all(10.0),
      child: TextFormField(
        onChanged: (text){
          change = text ;
        },
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'plase enter task dscription';
          }
          return null;
        },
        decoration: InputDecoration(
          hintText: '$texts',
          hintMaxLines: 1,
          hintStyle: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
