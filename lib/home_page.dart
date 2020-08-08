import 'package:flutter/material.dart';

import 'package:flutter_ielts_vocabulary/add_word.dart';
import 'package:flutter_ielts_vocabulary/vocabulary_detail.dart';
import 'package:flutter_ielts_vocabulary/vocabulary_model.dart';

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
        body: _buildVocabularyList(),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          tooltip: 'Add New Word',
          onPressed: () => Navigator.push<VocabularyDetail>(
            context,
            MaterialPageRoute<VocabularyDetail>(
              builder: (BuildContext context) => const AddNewWord(),
            ),
          ),
        ),
      );

  Widget _buildVocabularyList() => Container(
        color: Colors.white,
        child: ListView.separated(
          padding: const EdgeInsets.only(bottom: 92),
          itemCount: dictionary.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(height: 1),
          itemBuilder: (BuildContext context, int index) => Material(
            color: Colors.white,
            child: InkWell(
              child: ListTile(
                dense: true,
                leading: const CircleAvatar(
                  maxRadius: 16,
                  child: Icon(Icons.bubble_chart),
                ),
                title: Text(
                  dictionary[index].word,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  dictionary[index].synonyms,
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
                      model: dictionary[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
}

final List<VocabularyModel> dictionary = <VocabularyModel>[
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
  VocabularyModel(
    word: 'vocabulary',
    definitions: 'the body of words used in a particular language.',
    synonyms: 'lexis, word stock',
    checked: false,
  ),
];
