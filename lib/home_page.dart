import 'package:demo_app/viewmodel/todo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Provider.of<TodoViewModel>(context, listen: false).getTodos();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TodoViewModel>(builder: (context, value, child) {
        return ListView.builder(
          itemCount: value.todo.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: <Widget>[
                    CheckboxListTile(
                        activeColor: Colors.pink[300],
                        dense: true,
                        //font change
                        title: Text(
                          value.todo[index].title,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5),
                        ),
                        value: value.todo[index].completed, onChanged: (bool? value) {  },
                    )],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
