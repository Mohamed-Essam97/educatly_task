import 'package:educatly/data/injector.dart';
import 'package:educatly/logic/auth/auth_cubit.dart';
import 'package:educatly/logic/settings/bloc/language_bloc.dart';
import 'package:educatly/logic/settings/cubit/settings_cubit.dart';
import 'package:educatly/logic/settings/cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List providers = [
  BlocProvider(create: (_) => SettingsCubit()),
  BlocProvider(create: (_) => LanguageBloc()),
  BlocProvider(create: (_) => ThemeCubit()),
  BlocProvider(create: (_) => AuthCubit()),
];

void setupCubitsLocator() {
  locator.registerFactory<AuthCubit>(() => AuthCubit());
}
