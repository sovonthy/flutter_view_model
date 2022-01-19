import 'package:demo_app/model/todo.dart';
import 'package:demo_app/service/todo_service.dart';
import 'package:flutter/material.dart';

class TodoViewModel extends ChangeNotifier {
  List<Todo> _todos = [];
  List<Todo> _selectedTodos = [];

  List<Todo> get selectedTodos => _selectedTodos;

  set selectedTodos(List<Todo> value) {
    _selectedTodos = value;
    notifyListeners();
  }

  List<Todo> get todos => _todos;
  
  set todo(List<Todo> value) {
    _todos = value;
    notifyListeners();
  }

  Future<void> getTodos() async {
    var response = await TodoService.getTodos();
    todos.addAll(response);
    selectedTodos.addAll(todos.where((element) => element.completed == true));
    print(selectedTodos.length);
  }

  void addItemToCard(Todo todo) {
    selectedTodos.add(todo);
    print(selectedTodos.length);
  }

  void removeItemFromCard(Todo todo) {
    todos.singleWhere((element) => element.id == todo.id).completed == false;
    selectedTodos.remove(todo);
    notifyListeners();
 }

}