import 'package:flutter/material.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/models/taskmodel.dart';

class TasksItem extends StatelessWidget {
  TaskModel task;
  TasksItem(this.task);


  @override
  Widget build(BuildContext context) {
      TextTheme texttheme = Theme.of(context).textTheme;
  
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8 , horizontal: 20),
      decoration: BoxDecoration(
        color: Apptheme.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            height: 62,
            width: 4,
            margin: EdgeInsetsDirectional.only(end: 12),
            color: Apptheme.primary,

          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title
              ,style: texttheme.titleMedium?.copyWith(color: Apptheme.primary),
              ),
              Text(task.description
              ,style: texttheme.titleSmall,
              )
            ],
          ),
          Spacer(),
          Container(
            height:34 ,
            width:63 ,
            decoration:BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Apptheme.primary
            ) ,
            child: Icon(Icons.check , size: 32, color: Apptheme.white,),
          )
        ],
      ),
    );
  }
}