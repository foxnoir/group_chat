import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:japanese_tutorials_app/core/localization/localization_extensions.dart';
import 'package:japanese_tutorials_app/core/theme/media_consts.dart';

class PageContent extends Equatable {
  const PageContent({
    required this.image,
    required this.title,
    required this.description,
  });

  factory PageContent.first(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return PageContent(
      image: AppImg.learnJapanese,
      title: localizations.learnJapanese,
      description: localizations.learnJapaneseIntro,
    );
  }

  factory PageContent.second(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return PageContent(
      image: AppImg.kanji,
      title: localizations.masterKanji,
      description: localizations.masterKanjiIntro,
    );
  }

  factory PageContent.third(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return PageContent(
      image: AppImg.grammar,
      title: localizations.practiceGrammar,
      description: localizations.practiceGrammarIntro,
    );
  }

  final String image;
  final String title;
  final String description;

  @override
  List<Object?> get props => [image, title, description];
}
