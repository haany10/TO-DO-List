import 'package:flutter/material.dart';
import 'package:todo/models/taskmodel.dart';
import 'package:todo/widgets/firebasefuns.dart';

class TasksProvider with ChangeNotifier{
  List <TaskModel> tasks = [];
  DateTime selectedDate = DateTime.now();


   Future<void> gettasks() async{
    List<TaskModel> alltasks = await FirebaseFunctions.getAllTasksFromFirestore();
    tasks = alltasks.where((task) =>
     task.date.year == selectedDate.year&&
     task.date.month == selectedDate.month &&
     task.date.day == selectedDate.day
     ).toList();
    notifyListeners();
  }
  void gerSelectedDateTasks(DateTime date){
      selectedDate = date;
      gettasks();
  }


}