import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key key,
    this.title,
  }) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text(widget.title),
        ),
        body: const Center(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          tooltip: 'Add New Word',
          onPressed: () {},
        ),
      );
}
