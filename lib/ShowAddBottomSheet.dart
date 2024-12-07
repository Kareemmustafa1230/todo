import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/DataFirebase.dart';
import 'package:todo/Firebase.dart';
import 'package:todo/ListProvider.dart';
import 'package:todo/TaskListTab.dart';
import 'package:todo/TextFormFiled.dart';
import 'package:todo/Theme_Data.dart';

class ShowAddTaskBottom extends StatefulWidget {
  static const String routeName = 'Show-Add-Task-Bottom';

  @override
  State<ShowAddTaskBottom> createState() => _ShowAddTaskBottomState();
}

class _ShowAddTaskBottomState extends State<ShowAddTaskBottom> {
  DateTime SelectedDate = DateTime.now();
  var formKey = GlobalKey<FormState >();
  String title = '' ;
  String description = '' ;
 late ListProvider listProvider;
  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of<ListProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      color: MyTheme.whiteColor,
      child: Column(
        children: [
          Text('Add New Task',
          style: MyTheme.LightTheme.textTheme.titleMedium,
          ),
          Form(
            key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  EidetTask(texts: 'title Task',change: title ),
                  EidetTask(texts: 'Task details',change:description ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text('Select time',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: (){
                        ChoseData();
                      },
                      child: Text('${SelectedDate.day}/${SelectedDate.month}/${SelectedDate.year}',
                        style: MyTheme.LightTheme.textTheme.titleMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: size.width * 0.1),
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
                      onPressed: () {
                        AddTask();
                      },
                      child: Text(
                        'Add-Task',
                        style: TextStyle(
                          color: Colors.black,
                          backgroundColor: Colors.transparent,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }

  void ChoseData()async{
     var choseDay = await showDatePicker(
        context: context,
        initialDate:  SelectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)
        )
    );
     if(choseDay != null){
       SelectedDate = choseDay;
       setState(() {

       });
     }
  }

  void AddTask() {
    if(formKey.currentState?.validate()==true){
      Task task = Task(
          title: title,
          description: description,
          dataTime: SelectedDate
      );
      FirebaseUtils.addTaskToFirebase(task).timeout(
          Duration(microseconds: 300),onTimeout: (){
        listProvider.getAllTasks();
        Navigator.pop(context);
      });
    }
  }
}

