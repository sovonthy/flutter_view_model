import 'package:demo_app/viewmodel/todo_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardView extends StatefulWidget {
  const CardView({Key? key}) : super(key: key);

  @override
  _CardViewState createState() => _CardViewState();
}

class _CardViewState extends State<CardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TodoViewModel>(
        builder: (context, viewModel, child) {
            return ListView.builder(
              itemCount: viewModel.selectedTodos.length,
              itemBuilder: (BuildContext context, int index) {
                var todoItem = viewModel.selectedTodos[index];
                return Card(
                  margin: const EdgeInsets.only(left: 12, right: 12, top: 10),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        CheckboxListTile(
                          activeColor: Colors.pink[300],
                          dense: true,
                          title: Text(
                            todoItem.title,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                          value: todoItem.completed,
                          onChanged: (value) {
                            if (value == true) {
                              viewModel.addItemToCard(todoItem);
                            } else {
                              viewModel.removeItemFromCard(todoItem);
                            }
                            setState(() {
                              todoItem.completed = value!;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
        },
      ),
    );
  }
}
