import 'dart:convert';

import 'package:demo_app/model/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  static Future<List<Todo>> getTodos() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    List jsonValue = jsonDecode(response.body);
    List<Todo> list = jsonValue.map((value) => Todo.fromJson(value)).toList();
     return list;
  }
}
