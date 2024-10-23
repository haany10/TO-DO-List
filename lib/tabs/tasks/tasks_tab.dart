import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/tabs/tasks/tasks_item.dart';

class TasksTab extends StatelessWidget {
  
  
  @override
  Widget build(BuildContext context) {
    double screenheigth = MediaQuery.sizeOf(context).height; 
    return Column(
      children: [
        Stack(

          children: [
            Container(
              height: screenheigth*0.15,
              width: double.infinity,
              color: Apptheme.primary ,
            ),
            PositionedDirectional(
              start: 20,
              top: 20,
              child: SafeArea(
                child: Text('ToDo List' , 
                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Apptheme.white),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: screenheigth*0.10),
              child: EasyInfiniteDateTimeLine(
              firstDate: DateTime.now().subtract(Duration(days: 365)), 
              focusDate: DateTime.now(), 
              lastDate: DateTime.now().add(Duration(days: 365)),
              showTimelineHeader: false,
              dayProps: EasyDayProps(
                dayStructure: DayStructure.dayStrDayNum,
                height: 79,
                width: 58,
                activeDayStyle: DayStyle(
                  decoration: BoxDecoration(color: Apptheme.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                  dayNumStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Apptheme.primary
                  )
                  ,dayStrStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Apptheme.black
                  )
                ),
                inactiveDayStyle: DayStyle(
                  decoration: BoxDecoration(color: Apptheme.white, borderRadius: BorderRadius.all(Radius.circular(5))),
                  dayNumStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Apptheme.black
                  )
                  ,dayStrStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Apptheme.black
                  )
                ),
                
              ),
              ),
            )
            
           
      
          ],
        ),
         Expanded(child: ListView.builder(
           padding: EdgeInsets.only(top: 20),
           itemBuilder: (_ , index) => TasksItem() , itemCount: 10,))
      ],
    );
  }
}