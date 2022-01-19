import 'package:demo_app/viewmodel/todo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key}) : super(key: key);

  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Provider.of<TodoViewModel>(context, listen: false).getTodos();
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Consumer<TodoViewModel>(builder: (_, viewModel, __,) {
        return ListView.builder(
          itemCount: viewModel.todos.length,
          itemBuilder: (BuildContext context, int index) {
            var todoItem = viewModel.todos[index];

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
                            letterSpacing: 0.5),
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
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
