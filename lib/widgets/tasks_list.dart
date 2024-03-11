import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/task.dart';
import 'package:todo/widgets/tasks_tile.dart';
import 'package:todo/models/task_data.dart';


class TasksList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>( // use the Consumer widget to bring all provider functions to be performed to one widget
      builder: (context, taskData, child) { // builder requires 3 parameters that is context, a new name for the specified provider function(in this case taskData) and a child
        return ListView.builder( // also ensure to mention the return statement to the ListView
          itemBuilder: (context, index) {
            return TaskTile(
                isChecked: taskData.tasks[index].isDone,
                TaskTitle: taskData.tasks[index].name,
                checkboxCallback: (bool? checkboxState) {
                  taskData.updateTask(taskData.tasks[index]);
                },
                longpressCallback: (){
                  Task task = Task(name: '');
                  taskData.deleteTask(task);
                },);
          },
          itemCount: taskData.tasks.length,
        );
      },
    );
  }
}