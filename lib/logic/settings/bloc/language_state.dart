part of 'language_bloc.dart';

class LanguageState extends Equatable {
  const LanguageState({
    Language? selectedLanguage,
  }) : selectedLanguage = selectedLanguage ?? Language.english;

  final Language selectedLanguage;

  @override
  List<Object> get props => [selectedLanguage];

  @override
  bool get stringify => selectedLanguage.value.languageCode.isEmpty;

  LanguageState copyWith({Language? selectedLanguage}) {
    return LanguageState(
      selectedLanguage: selectedLanguage ?? this.selectedLanguage,
    );
  }
}
