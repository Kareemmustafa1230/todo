import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/DataFirebase.dart';
import 'package:todo/Firebase.dart';
import 'package:todo/TextFormFiled.dart';

class BottomTask extends StatefulWidget {
  static const String routeName = 'Bottom-Task';

  @override
  State<BottomTask> createState() => _BottomTaskState();
}

class _BottomTaskState extends State<BottomTask> {
  DateTime EditData = DateTime.now();
  var toKey = GlobalKey<FormState >();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'To Do List',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        color: Color(0xffC4DCD6FF),
        child: Center(
          child: Column(
            children: [
              Expanded(child: SizedBox()),
              Expanded(
                flex: 7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
                    child: SizedBox(
                      width: size.width * 0.9,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: size.width * 0.15,
                              bottom: size.width * 0.1,
                            ),
                            child: Text('Edit task',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withOpacity(0.8),
                              ),
                            ),
                          ),
                          Form(
                            key: toKey ,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(10.0),
                                 // TextFormFiled(),
                                  child: Row(
                                    children: [
                                      Text('Select time',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w300,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: InkWell(
                                    onTap: () {
                                      ChoseData();
                                    },
                                    child: Text(
                                      '${EditData.day}/${EditData.month}/${EditData.year}',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 23,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: size.width * 0.3),
                          Container(
                            margin: EdgeInsets.only(bottom: size.width * 0.05),
                            height: size.width / 8,
                            width: size.width / 1.25,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Save-Changes',
                                style: TextStyle(
                                  color: Colors.black,
                                  backgroundColor: Colors.transparent,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
    );
  }
  void ChoseData() async {
    var EditaDay = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (EditaDay != null) {
      EditData = EditaDay;
      setState(() {});
    }
  }
}
