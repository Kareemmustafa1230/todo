import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/DataFirebase.dart';
import 'package:todo/Firebase.dart';
import 'package:todo/ListProvider.dart';
import 'package:todo/widgetTask.dart';

class TaskListTab extends StatefulWidget {
  static const String routeName = 'Task-List-Tab';

  @override
  _TaskListTabState createState() => _TaskListTabState();
}

 class _TaskListTabState extends State<TaskListTab> {

   @override
   Widget build(BuildContext context) {
     var listProvider = Provider.of<ListProvider>(context);
     if (listProvider.taskList.isEmpty) {
       listProvider.getAllTasks();
     }
     return Container(
       color: Color(0xffDFECDB),
       child: Column(
         children: [
           CalendarTimeline(
             initialDate: DateTime.now(),
             firstDate: DateTime.now(),
             lastDate: DateTime.now().add(Duration(days: 365)),
             onDateSelected: (date) => print(date),
             leftMargin: 20,
             monthColor: Colors.blueGrey,
             dayColor: Colors.teal[200],
             activeDayColor: Colors.white,
             activeBackgroundDayColor: Colors.redAccent[100],
             dotsColor: Color(0xFF333A47),
             locale: 'en_ISO',
           ),
           Expanded(
             child: ListView.builder(
               itemBuilder: (context, index) {
                 return WidgetTask(task: listProvider.taskList[index]);
               },
               itemCount: listProvider.taskList.length,
             ),
           ),
         ],
       ),
     );
   }
 }