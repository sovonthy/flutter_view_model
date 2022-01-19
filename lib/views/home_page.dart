import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:demo_app/views/card_view.dart';
import 'package:demo_app/viewmodel/todo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late int currentIndex;

  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Provider.of<TodoViewModel>(context, listen: false).getTodos();
    });
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Todo"),
      ),
      body: Consumer<TodoViewModel>(builder: (
        _,
        viewModel,
        __,
      ) {
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
      floatingActionButton: FloatingActionButton(
        child: const Text("Card"),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CardView()),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        fabLocation: BubbleBottomBarFabLocation.end, //new
        hasNotch: true, //new
        hasInk: true, //new, gives a cute ink effect
        inkColor: Colors.black12,
        items: const <BubbleBottomBarItem>[
          BubbleBottomBarItem(backgroundColor: Colors.red, icon: Icon(Icons.dashboard, color: Colors.black,), activeIcon: Icon(Icons.dashboard, color: Colors.red,), title: Text("Home")),
          BubbleBottomBarItem(backgroundColor: Colors.deepPurple, icon: Icon(Icons.access_time, color: Colors.black,), activeIcon: Icon(Icons.access_time, color: Colors.deepPurple,), title: Text("Logs")),
          BubbleBottomBarItem(backgroundColor: Colors.indigo, icon: Icon(Icons.folder_open, color: Colors.black,), activeIcon: Icon(Icons.folder_open, color: Colors.indigo,), title: Text("Folders")),
          BubbleBottomBarItem(backgroundColor: Colors.green, icon: Icon(Icons.menu, color: Colors.black,), activeIcon: Icon(Icons.menu, color: Colors.green,), title: Text("Menu"))
        ],
      ),
    );
  }
}
