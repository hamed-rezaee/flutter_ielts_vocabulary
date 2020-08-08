import 'package:flutter/material.dart';
import 'package:flutter_ielts_vocabulary/vocabulary_model.dart';

class AddNewWord extends StatefulWidget {
  const AddNewWord({Key key}) : super(key: key);

  @override
  _AddNewWordState createState() => _AddNewWordState();
}

class _AddNewWordState extends State<AddNewWord> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  VocabularyModel model = VocabularyModel();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Add New Word'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {},
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
