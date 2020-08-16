import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_ielts_vocabulary/confirm_dialog.dart';
import 'package:flutter_ielts_vocabulary/words.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VocabularyDetail extends StatefulWidget {
  const VocabularyDetail({
    @required this.model,
  });

  final Word model;

  @override
  _VocabularyDetailState createState() => _VocabularyDetailState();
}

class _VocabularyDetailState extends State<VocabularyDetail> {
  Word _model;

  FlutterTts flutterTts = FlutterTts();

  List<String> _definitions = <String>[];
  List<String> _synonyms = <String>[];
  List<String> _opposites = <String>[];

  @override
  void initState() {
    super.initState();

    _model = widget.model;

    if (_model.definitions.isNotEmpty) {
      _definitions = _model.definitions
          .split(',')
          .map<String>((String item) => item.trim())
          .toList();
    }

    if (_model.synonyms.isNotEmpty) {
      _synonyms = _model.synonyms
          .split(',')
          .map<String>((String item) => item.trim())
          .toList();
    }

    if (_model.opposites.isNotEmpty) {
      _opposites = _model.opposites
          .split(',')
          .map<String>((String item) => item.trim())
          .toList();
    }

    setupTTS();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Definitions'),
          actions: <Widget>[
            IconButton(
              tooltip: 'Delete',
              icon: const Icon(Icons.delete),
              onPressed: () async {
                final bool result = await showAlertDialog(context);

                if (result) {
                  await Provider.of<AppDatabase>(context, listen: false)
                      .deleteItem(_model);

                  Navigator.pop(context);
                }
              },
            ),
            IconButton(
              tooltip: 'Mark as Learned',
              icon: Icon(
                _model.checked
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
              ),
              onPressed: () {
                Provider.of<AppDatabase>(context, listen: false).updateItem(
                    _model = _model.copyWith(checked: !_model.checked));

                setState(() {});
              },
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              _buildMianWord(),
              const Divider(),
              Expanded(
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return false;
                  },
                  child: ListView(
                    children: <Widget>[
                      if (_definitions.isNotEmpty)
                        _buildWordList('Definitions', _definitions),
                      if (_definitions.isNotEmpty) const Divider(),
                      if (_synonyms.isNotEmpty)
                        _buildWordList('Synonyms', _synonyms),
                      if (_synonyms.isNotEmpty) const Divider(),
                      if (_opposites.isNotEmpty)
                        _buildWordList('Opposites', _opposites),
                      if (_opposites.isNotEmpty) const Divider(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget _buildMianWord() => Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              _model.word,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            _buildSpeakButton(context, _model.word)
          ],
        ),
      );

  Widget _buildWordList(String title, List<String> words) => Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 8),
            NotificationListener<OverscrollIndicatorNotification>(
              onNotification: (OverscrollIndicatorNotification overscroll) {
                overscroll.disallowGlow();
                return false;
              },
              child: ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                itemCount: words.length,
                itemBuilder: (BuildContext context, int index) => ListTile(
                  dense: true,
                  title: Text(
                    words[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                  trailing: _buildSpeakButton(context, words[index]),
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildSpeakButton(BuildContext context, String text) => IconButton(
        icon: Icon(
          Icons.volume_up,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () => flutterTts.speak(
          text
              .replaceAll('(v)', '')
              .replaceAll('(n)', '')
              .replaceAll('(adv)', '')
              .replaceAll('(adj)', ''),
        ),
      );

  Future<void> setupTTS() async {
    // flutterTts.setCompletionHandler(() {
    // });

    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.7);
    await flutterTts.setPitch(0.9);
  }
}
