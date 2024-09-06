import 'package:bloc/bloc.dart';
import 'package:educatly/logic/settings/bloc/language_model.dart';
import 'package:equatable/equatable.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState()) {
    on<ChangeLanguage>(onChangeLanguage);
  }

  onChangeLanguage(ChangeLanguage event, Emitter<LanguageState> emit) async {
    emit(state.copyWith(selectedLanguage: event.selectedLanguage));
  }
}
