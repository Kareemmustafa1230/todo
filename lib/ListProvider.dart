import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/DataFirebase.dart';
import 'package:todo/Firebase.dart';

class ListProvider extends ChangeNotifier{
  List<Task> taskList = [];
  void getAllTasks() async {
    QuerySnapshot<Task> querySnapshot =
    await FirebaseUtils.getTasksCollection().get();
    List<Task> tempList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    taskList = tempList;
    notifyListeners();
  }
}