
class Lix {

  int words;


  int longWords;


  int periods;





  late int readability;


    required this.words,
    required this.longWords,
    required this.periods,
  }) {
    readability = _calculate();
  }

  factory Lix.fromString(String text) {

    var periods = RegExp(r'[.:;!?]').allMatches(text).length;

    var allWords = text.split(RegExp(r'\W+'));
    var words = allWords.length;
    var longWords = allWords.where((w) => w.length > 6).toList().length;

    return Lix(words: words, longWords: longWords, periods: periods);
  }

  int _calculate() {
    int result;

    if (words == 0 || periods == 0) {
      throw ArgumentError('Text must contain at least one full sentence.');
    } else {
      final sentenceLength = words / periods;
      final wordLength = (longWords * 100) / words;
      result = (sentenceLength + wordLength).round();
    }

    return result;
  }

  String describe() {
    if (readability > 0 && readability < 20) {
      return 'very easy';
    } else if (readability < 30) {
      return 'easy';
    } else if (readability < 40) {
      return 'a little hard';
    } else if (readability < 50) {
      return 'hard';
    } else if (readability < 60) {
      return 'very hard';
    } else {
      return 'unknown';
    }
  }
}
