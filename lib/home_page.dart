import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        ),
        body: _buildVocabularyList(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          tooltip: 'Add New Word',
          onPressed: () => Navigator.push<VocabularyDetail>(
            context,
            MaterialPageRoute<VocabularyDetail>(
              builder: (BuildContext context) => AddNewWord(),
            ),
          ),
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
                                ? Icons.assignment_turned_in
                                : Icons.assignment_late,
                          ),
                        ),
                        title: Text(
                          snapshot.data[index].word,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          snapshot.data[index].synonyms,
                          style: const TextStyle(
                            fontSize: 12,
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
}
