import 'package:flutter/material.dart';

class ChooseLanguagePage extends StatelessWidget {
  static String tag = 'choose-language-page';

  @override
  Widget build(BuildContext context) {

    final body = SizedBox(
         width: double.infinity,
         height: double.infinity,
         child: Image.asset('assets/background.png'),
    );

    return Scaffold(
      body: body,
    );
  }
}