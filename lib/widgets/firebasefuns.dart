import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/models/taskmodel.dart';

class FirebaseFunctions {
  static CollectionReference<TaskModel> getTasksCollection() =>
    FirebaseFirestore.instance.collection('tasks').withConverter<TaskModel>(
      fromFirestore: (docSnapshot, options) =>
        TaskModel.fromJson(docSnapshot.data()!),
      toFirestore: (taskModel, _) => taskModel.tojson(),
    );

  static Future<void> addTaskToFirestore(TaskModel task) {
    CollectionReference<TaskModel> tasksCollection = getTasksCollection();
    DocumentReference<TaskModel> doc = tasksCollection.doc();
    task.id = doc.id;
    return doc.set(task);
  }

  static Future<List<TaskModel>> getAllTasksFromFirestore() async {
    CollectionReference<TaskModel> tasksCollection = getTasksCollection();
    QuerySnapshot<TaskModel> querySnapshot = await tasksCollection
    .get();
    return querySnapshot.docs.map((docSnapshot) => docSnapshot.data()).toList();
  }

  static Future<void> deleteTask(String taskID) async {
    CollectionReference<TaskModel> tasksCollection =  getTasksCollection();
    return tasksCollection.doc(taskID).delete();


    
  }

}
