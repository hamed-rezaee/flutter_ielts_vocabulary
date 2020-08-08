import 'package:flutter/material.dart';

import 'package:flutter_ielts_vocabulary/home_page.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'IELTS Vocabulary',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomePage(title: 'IELTS Vocabulary'),
      );
}
