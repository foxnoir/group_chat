import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FallbackLocalizations {
  factory FallbackLocalizations() {
    return _instance;
  }

  FallbackLocalizations._internal();
  static final FallbackLocalizations _instance =
      FallbackLocalizations._internal();

  String get learnJapanese => 'Learn Japanese';
  String get learnJapaneseIntro =>
      'Discover the beauty of the Japanese language with our app.';
  String get masterKanji => 'Master Kanji';
  String get masterKanjiIntro =>
      'Learn the most important Kanji with interactive exercises.';
  String get practiceGrammar => 'Practice Grammar';
  String get practiceGrammarIntro =>
      'Enhance your grammar skills with focused lessons.';
}

extension AppLocalizationsWithFallback on AppLocalizations? {
  FallbackLocalizations get fallback => FallbackLocalizations();

  String get learnJapanese => this?.learnJapanese ?? fallback.learnJapanese;
  String get learnJapaneseIntro =>
      this?.learnJapaneseIntro ?? fallback.learnJapaneseIntro;
  String get masterKanji => this?.masterKanji ?? fallback.masterKanji;
  String get masterKanjiIntro =>
      this?.masterKanjiIntro ?? fallback.masterKanjiIntro;
  String get practiceGrammar =>
      this?.practiceGrammar ?? fallback.practiceGrammar;
  String get practiceGrammarIntro =>
      this?.practiceGrammarIntro ?? fallback.practiceGrammarIntro;
}
