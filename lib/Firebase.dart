import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/DataFirebase.dart';

class FirebaseUtils {
  static CollectionReference<Task> getTasksCollection() {
    return FirebaseFirestore.instance.collection(Task.collectionName).withConverter<Task>(
      fromFirestore: (snapshot, options) => Task.fromFireStore(snapshot.data()!),
      toFirestore: (task, options) => task.toFireStore(),
    );
  }

  static Future <void> addTaskToFirebase(Task task) {
    var taskCollection = getTasksCollection();
    DocumentReference<Task> taskDocRef = taskCollection.doc();
    task.id = taskDocRef.id;
    return taskDocRef.set(task);
  }
  static Future <void> DeleteTask(Task task){
    return getTasksCollection().doc(task.id).delete();
  }

}