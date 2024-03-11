import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String TaskTitle;
  final bool isChecked ;
  final Function checkboxCallback;
  final longpressCallback;
  TaskTile({required this.isChecked, required this.TaskTitle, required this.checkboxCallback, required this.longpressCallback});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longpressCallback,
      title: Text(
        TaskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: isChecked,
      onChanged: (newValue) { 
          checkboxCallback(newValue);
       }, 
    ),
    );
  }
}


 







 
