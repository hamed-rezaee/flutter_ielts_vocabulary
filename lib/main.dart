import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_ielts_vocabulary/home_page.dart';
import 'package:flutter_ielts_vocabulary/words.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Provider<AppDatabase>(
        create: (BuildContext context) => AppDatabase(),
        child: MaterialApp(
          title: 'IELTS Vocabulary',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(),
        ),
      );
}
