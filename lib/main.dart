import 'package:demo_app/views/card_view.dart';
import 'package:demo_app/views/register_page.dart';
import 'package:demo_app/viewmodel/todo_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/choose_language_page.dart';
import 'views/login_page.dart';
import 'views/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TodoViewModel()),
      ],
      child: MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const HomeView(),
    );
  }
}
