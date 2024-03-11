import 'package:flutter/material.dart';
import 'task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier{
  

   List<Task> _tasks = [ // by adding an underscore to the tasks we making the variable private and only accessible in this class
    Task(name: 'Buy Milk',),
    Task(name: 'But Eggs'),
    Task(name: 'Buy Bread'),
  ];

  
  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  void addTask(String newTaskTitle){
    final task = Task(name: newTaskTitle);
    _tasks.add(task);
    notifyListeners();
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }
  

  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}