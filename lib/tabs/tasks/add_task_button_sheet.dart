//import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/models/taskmodel.dart';
import 'package:todo/tabs/tasks/tasks_provider.dart';
import 'package:todo/widgets/default_elevated_button.dart';
import 'package:todo/widgets/firebasefuns.dart';
import 'package:todo/widgets/textfield.dart';

class AddTaskButtSheet extends StatefulWidget {
  
  @override
  State<AddTaskButtSheet> createState() => _AddTaskButtSheetState();
}

class _AddTaskButtSheetState extends State<AddTaskButtSheet> {
  TextEditingController tasktitle = TextEditingController();

  TextEditingController taskdescription = TextEditingController();

  DateFormat dateformat = DateFormat('dd/MM/yyyy');

  DateTime selectedtime = DateTime.now();
  var formkey = GlobalKey<FormState>();

  @override

  Widget build(BuildContext context) {
    TextStyle? titlemedstyle = Theme.of(context).textTheme.titleMedium;
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        height: MediaQuery.sizeOf(context).height*0.5,
        decoration: BoxDecoration(
          color: Apptheme.white,
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(15) , right: Radius.circular(15)
          )
        ),
        padding: EdgeInsets.all(20),
        child: Form(
          key:formkey ,
          child: Column(
            children: [
              Text('Add new task',
              style: titlemedstyle,
              ),
              SizedBox(height: 16,),
              DefaultTextFormField(controller: tasktitle, hinttext: 'Enter task title' ,
              validator: (value) {
                if(value==null || value.trim().isEmpty)
                return'Title can not be empty';
                return null;
              }
              
              ,
              ),
              DefaultTextFormField(controller: taskdescription, hinttext: 'Enter task description'
              , validator:(value) {
                if(value==null || value.trim().isEmpty)
                return'Description can not be empty';
                return null;
              },
              ),
              SizedBox(height: 16,),
              Text('Select date' , 
              style: titlemedstyle?.copyWith(fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 8,),
              InkWell(
                onTap: () async{
                  DateTime? dateTime = await showDatePicker(
                  context: context,
                   firstDate: DateTime.now(), 
                   lastDate: DateTime.now().add(Duration(days: 365)),
                   initialDate:selectedtime ,
                   initialEntryMode: DatePickerEntryMode.calendarOnly
                   );
                   if(dateTime != null && dateTime!= selectedtime)
                   {
                    selectedtime = dateTime;
                    setState(() {
                      
                    });
                   }
                },
                child: Text(dateformat.format(DateTime.now())))
                , SizedBox(height: 32,),
        
                DefaultElevButton(label: 'Add task', onPressed: (){
                  if (formkey.currentState!.validate())
                  addTask();
                }
                )
            ],
          ),
        ),
      ),
    );
  }
  void addTask(){
    TaskModel task = TaskModel(
     
     title: tasktitle.text, 
     description: taskdescription.text,
     date: selectedtime, 
    
    );
    FirebaseFunctions.addTaskToFirestore(task).timeout(
      Duration(microseconds: 100),
      onTimeout: (){
        Navigator.of(context).pop();
        Provider.of<TasksProvider>(context , listen: false).gettasks();
        Fluttertoast.showToast(
        msg: "Task added successfully",
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5,
        backgroundColor: Apptheme.green,
        
    );
      },
      

    ).catchError((error){
      Fluttertoast.showToast(
        msg: "Something went wrong",
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 5,
        backgroundColor: Apptheme.red,
        
    );
    });
  }
}