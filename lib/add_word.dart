import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_ielts_vocabulary/words.dart';

class AddNewWord extends StatefulWidget {
  @override
  _AddNewWordState createState() => _AddNewWordState();
}

class _AddNewWordState extends State<AddNewWord> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Word model = Word(checked: false);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Add New Word'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                _formKey.currentState.save();

                Provider.of<AppDatabase>(context, listen: false)
                    .insertItem(model);

                Navigator.pop(context);
              },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Word',
                      contentPadding: const EdgeInsets.all(8),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onSaved: (String value) =>
                        model = model.copyWith(word: value),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Definitions',
                      contentPadding: const EdgeInsets.all(8),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    onSaved: (String value) =>
                        model = model.copyWith(definitions: value),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    style: const TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'Synonyms',
                      contentPadding: const EdgeInsets.all(8),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    maxLines: 5,
                    keyboardType: TextInputType.multiline,
                    onSaved: (String value) =>
                        model = model.copyWith(synonyms: value),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
