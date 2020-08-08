import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:provider/provider.dart';

import 'package:flutter_ielts_vocabulary/confirm_dialog.dart';
import 'package:flutter_ielts_vocabulary/words.dart';

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

  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    _model = widget.model;

    setupTTS();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Definitions'),
          actions: <Widget>[
            IconButton(
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
        body: Card(
          elevation: 2,
          margin: const EdgeInsets.all(8),
          shape: Border(
            right: BorderSide(
              color: Theme.of(context).accentColor.withOpacity(0.7),
              width: 5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      _model.word,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.volume_up,
                        color: isPlaying
                            ? Theme.of(context).primaryColor.withOpacity(0.3)
                            : Theme.of(context).primaryColor,
                      ),
                      onPressed: isPlaying
                          ? null
                          : () async {
                              final int result =
                                  await flutterTts.speak(_model.word);

                              if (result == 1) {
                                setState(() => isPlaying = true);
                              }
                            },
                    )
                  ],
                ),
                const SizedBox(height: 4),
                const Divider(),
                const SizedBox(height: 8),
                const Text(
                  'Definitions',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    _model.definitions,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Synonyms',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    _model.synonyms,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Future<void> setupTTS() async {
    flutterTts.setCompletionHandler(() {
      setState(() => isPlaying = false);
    });

    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.setPitch(0.9);
  }
}
