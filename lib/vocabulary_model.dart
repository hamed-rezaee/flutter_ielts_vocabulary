class VocabularyModel {
  VocabularyModel({
    this.word,
    this.definitions,
    this.synonyms,
    this.checked,
  });

  final String word;
  final String definitions;
  final String synonyms;
  final bool checked;

  VocabularyModel copyWith({
    String word,
    String definitions,
    String synonyms,
    bool checked,
  }) =>
      VocabularyModel(
        word: word ?? this.word,
        definitions: definitions ?? this.definitions,
        synonyms: synonyms ?? this.synonyms,
        checked: checked ?? this.checked,
      );
}
