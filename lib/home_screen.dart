import 'package:flutter/material.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/tabs/settings/settings_tab.dart';
import 'package:todo/tabs/tasks/add_task_button_sheet.dart';
import 'package:todo/tabs/tasks/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routename = '/homescreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <Widget> tabs = [
    TasksTab(),
    SettingsTab()
  ];
  int currentTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentTabIndex],
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        padding: EdgeInsets.zero,
        color: Apptheme.white,
        child: BottomNavigationBar(
          elevation: 0, 
          currentIndex: currentTabIndex,
          onTap: (value) => setState(() {
            currentTabIndex = value;
          }) ,
          items:[ BottomNavigationBarItem(
            label: 'Tasks',
            icon: Icon(Icons.list , size: 32,))
        , BottomNavigationBarItem(
          label: 'Settings',
          icon: Icon(Icons.settings , size: 32,))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(context: context, builder: (_) => AddTaskButtSheet() , isScrollControlled: true),
        child: Icon(Icons.add , 
        size: 32,
        
        ),
        
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}