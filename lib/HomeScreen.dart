import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/SettingsTab.dart';
import 'package:todo/ShowAddBottomSheet.dart';
import 'package:todo/TaskListTab.dart';
import 'package:todo/Theme_Data.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'Home-Screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int SelectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.primaryLight,
        title: Text(
          'To Do List',
          style: MyTheme.LightTheme.textTheme.titleSmall
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: SelectIndex,
          onTap: (index) {
            SelectIndex = index ;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Task List',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Setting',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: StadiumBorder(
            side: BorderSide(
             color: Colors.white,
              width: 8,
        )),
        onPressed: () {
          ShowTaskAddBottomSheet(context);
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: tabs[SelectIndex],

    );
  }

  List<Widget> tabs = [TaskListTab(), SettingsTab()];

  void ShowTaskAddBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => ShowAddTaskBottom()
    );
  }
}
