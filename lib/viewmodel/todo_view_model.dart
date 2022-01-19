import 'package:demo_app/model/todo.dart';
import 'package:demo_app/service/todo_service.dart';
import 'package:flutter/material.dart';

class TodoViewModel extends ChangeNotifier {
  List<Todo> _todo = [];

  List<Todo> get todo => _todo;
  
  set todo(List<Todo> value) {
    _todo = value;
    notifyListeners();
  }

  Future<void> getTodos() async {
    var response = await TodoService.getTodos();
    todo.addAll(response);
    print(response);
  }
  
  

}