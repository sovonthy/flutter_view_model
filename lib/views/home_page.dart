import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:demo_app/views/register_page.dart';
import 'package:demo_app/views/todo_view.dart';
import 'package:demo_app/widgets/navigation_header.dart';
import 'package:demo_app/widgets/navigation_item.dart';
import 'package:flutter/material.dart';

import 'card_view.dart';
import 'login_page.dart';

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
    super.initState();
    currentIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            NavHeader(),
            const Divider(),
            const NavItem(
              title: "Card",
              icon: Icons.list_alt_outlined,
              widget: CardView(),
            ),
            NavItem(
              title: "Login",
              icon: Icons.video_settings_outlined,
              widget: LoginPage(),
            ),
            NavItem(
              title: "Register",
              icon: Icons.timeline_outlined,
              widget: LoginPage(),
            ),
            NavItem(
              title: "Forgot password",
              icon: Icons.save_alt_outlined,
              widget: LoginPage(),
            ),
          ],
        ),
      ),
      body: IndexedStack(
        children: [const TodoView(), const CardView(), LoginPage(), RegisterPage()],
        index: currentIndex,
      ),
      bottomNavigationBar: BubbleBottomBar(
        opacity: .2,
        currentIndex: currentIndex,
        onTap: changePage,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        elevation: 8,
        hasNotch: true,
        hasInk: true,
        inkColor: Colors.black12,
        items: const <BubbleBottomBarItem>[
          BubbleBottomBarItem(
              backgroundColor: Colors.red,
              icon: Icon(
                Icons.dashboard,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.red,
              ),
              title: Text("Home")),
          BubbleBottomBarItem(
              backgroundColor: Colors.deepPurple,
              icon: Icon(
                Icons.access_time,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.access_time,
                color: Colors.deepPurple,
              ),
              title: Text("My Card")),
          BubbleBottomBarItem(
              backgroundColor: Colors.indigo,
              icon: Icon(
                Icons.folder_open,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.folder_open,
                color: Colors.indigo,
              ),
              title: Text("Folders")),
          BubbleBottomBarItem(
              backgroundColor: Colors.green,
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              activeIcon: Icon(
                Icons.menu,
                color: Colors.green,
              ),
              title: Text("Menu"))
        ],
      ),
    );
  }
}
