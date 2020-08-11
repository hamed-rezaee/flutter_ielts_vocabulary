import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_ielts_vocabulary/add_word.dart';
import 'package:flutter_ielts_vocabulary/vocabulary_detail.dart';
import 'package:flutter_ielts_vocabulary/words.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('IELTS Vocabulary'),
          actions: <Widget>[
            IconButton(
              tooltip: 'Export',
              icon: const Icon(Icons.cloud_upload),
              onPressed: () async {
                final AppDatabase databas =
                    Provider.of<AppDatabase>(context, listen: false);
                final List<Word> words = await databas.getAll();

                final String result = jsonEncode(words);
              },
            ),
            IconButton(
              tooltip: 'Add New Word',
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push<AddNewWord>(
                  context,
                  MaterialPageRoute<AddNewWord>(
                    builder: (BuildContext context) => AddNewWord(),
                  ),
                );
              },
            ),
          ],
        ),
        body: _buildVocabularyList(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.cloud_download),
          tooltip: 'Import',
          onPressed: () async {
            final File file = await FilePicker.getFile();
            final String content = await file.readAsString();

            await importFromFile(content);
          },
        ),
      );

  Widget _buildVocabularyList() => Container(
        color: Colors.white,
        child: StreamBuilder<List<Word>>(
            stream: Provider.of<AppDatabase>(context).watchAll(),
            builder: (BuildContext context,
                    AsyncSnapshot<List<Word>> snapshot) =>
                ListView.separated(
                  padding: const EdgeInsets.only(bottom: 92),
                  itemCount: snapshot.data?.length ?? 0,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(height: 1),
                  itemBuilder: (BuildContext context, int index) => Material(
                    color: Colors.white,
                    child: InkWell(
                      child: ListTile(
                        dense: true,
                        leading: CircleAvatar(
                          maxRadius: 18,
                          child: Icon(
                            snapshot.data[index].checked
                                ? Icons.brightness_high
                                : Icons.brightness_low,
                            color: Colors.white,
                          ),
                          backgroundColor: Theme.of(context).accentColor,
                        ),
                        title: Text(
                          snapshot.data[index].word,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data[index].synonyms == ''
                              ? snapshot.data[index].definitions
                              : snapshot.data[index].synonyms,
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () => Navigator.push<VocabularyDetail>(
                          context,
                          MaterialPageRoute<VocabularyDetail>(
                            builder: (BuildContext context) => VocabularyDetail(
                              model: snapshot.data[index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )),
      );

  Future<void> importFromFile(String content) async {
    final List<dynamic> items = jsonDecode(content);
    final AppDatabase databas =
        Provider.of<AppDatabase>(context, listen: false);

    for (final dynamic item in items) {
      final Word word = Word(
        word: item['word'] ?? '',
        definitions: item['definitions'] ?? '',
        synonyms: item['synonyms'] ?? '',
        opposites: item['opposites'] ?? '',
        checked: false,
      );

      await databas.insertItem(word);
    }
  }
}
